# Deploying STATION1 (CV-Maker) on Ubuntu

Native install on a home server: **rbenv + PostgreSQL + Nginx**, Puma managed by
**systemd**, exposed to the internet via a **Cloudflare Tunnel** (`cloudflared`) —
no port-forwarding, no public IP, no Certbot (Cloudflare terminates TLS at the edge).
Active Storage stays on local disk in a persistent dir.

```
Browser ──https──> Cloudflare edge (TLS for station1.me)
                        │  (outbound tunnel, no inbound ports)
                   cloudflared (on the laptop)
                        │  http://localhost:8090
                   Nginx 127.0.0.1:8090 (static files) ──> Puma (unix socket) ──> Rails 7
                                                                  ↓
                                                      PostgreSQL (localhost)
                                                      shared/storage (uploads on disk)
```

Files in this directory:

| File | Goes to |
|------|---------|
| `station1.service`     | `/etc/systemd/system/station1.service` |
| `nginx-station1.conf`  | `/etc/nginx/sites-available/station1` (listens on `127.0.0.1:8090`) |
| `cloudflared-config.yml` | `/etc/cloudflared/config.yml` (after `cloudflared tunnel create`) |
| `.env.example`         | copy to `/var/www/station1/shared/.env`, fill in, `chmod 600` |
| `../bin/deploy.sh`     | runs in place from `/var/www/station1/current` for redeploys |

Before editing, substitute placeholders (`YOUR_DOMAIN`, `DEPLOY_USER`,
`STRONG_DB_PASSWORD`, `PASTE_CONTENTS_OF_config_master.key`).

## One-time provisioning (Part B)

1. **Base packages**
   ```bash
   sudo apt update && sudo apt upgrade -y
   sudo apt install -y git curl nginx postgresql libpq-dev \
     build-essential libssl-dev libreadline-dev zlib1g-dev libyaml-dev \
     libffi-dev autoconf bison
   ```
2. **PostgreSQL role + db**
   ```bash
   sudo -u postgres psql -c "CREATE USER station1 WITH PASSWORD 'STRONG_DB_PASSWORD';"
   sudo -u postgres psql -c "CREATE DATABASE station1_production OWNER station1;"
   ```
3. **Ruby 3.4.6 via rbenv** (matches `.ruby-version`)
   ```bash
   git clone https://github.com/rbenv/rbenv.git ~/.rbenv
   git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
   echo 'export PATH="$HOME/.rbenv/bin:$PATH"; eval "$(rbenv init -)"' >> ~/.bashrc
   source ~/.bashrc
   rbenv install 3.4.6 && rbenv global 3.4.6
   gem install bundler
   ```
4. **App dir + code + persistent dirs**
   ```bash
   sudo mkdir -p /var/www/station1 && sudo chown $USER:$USER /var/www/station1
   cd /var/www/station1
   git clone <repo-url> current && cd current
   mkdir -p /var/www/station1/shared/storage tmp/sockets tmp/pids
   ```
5. **Env file** — copy `deploy/.env.example` to `/var/www/station1/shared/.env`,
   fill it in, `chmod 600`.
6. **Gems, assets, migrate**
   ```bash
   set -a; source /var/www/station1/shared/.env; set +a
   bundle config set --local without 'development test'
   bundle install
   bundle exec rails assets:precompile
   bundle exec rails db:migrate
   ```
7. **systemd** — install `station1.service`, then:
   ```bash
   sudo systemctl daemon-reload && sudo systemctl enable --now station1
   ```
8. **Nginx** — install `nginx-station1.conf`, then:
   ```bash
   sudo ln -s /etc/nginx/sites-available/station1 /etc/nginx/sites-enabled/
   sudo rm -f /etc/nginx/sites-enabled/default
   sudo nginx -t && sudo systemctl reload nginx
   ```
9. **Cloudflare Tunnel** (instead of Certbot — Cloudflare provides edge TLS):
   ```bash
   # Install cloudflared (Cloudflare apt repo)
   sudo mkdir -p --mode=0755 /usr/share/keyrings
   curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | \
     sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
   echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main" | \
     sudo tee /etc/apt/sources.list.d/cloudflared.list
   sudo apt update && sudo apt install -y cloudflared

   cloudflared tunnel login                 # opens a browser URL; pick the station1.me zone
   cloudflared tunnel create station1       # prints the TUNNEL_UUID + writes ~/.cloudflared/<UUID>.json
   cloudflared tunnel route dns station1 station1.me
   cloudflared tunnel route dns station1 www.station1.me

   # Put cloudflared-config.yml (with the UUID filled in) at /etc/cloudflared/config.yml, then:
   sudo cloudflared service install
   sudo systemctl enable --now cloudflared
   ```
   In the Cloudflare dashboard set **SSL/TLS → Overview → Full** (not Flexible, which
   would redirect-loop against `force_ssl`).
10. **Firewall** — no inbound web ports are needed (the tunnel is outbound-only):
    ```bash
    sudo ufw allow OpenSSH
    # If this laptop also serves media on the LAN, allow those ports too before enabling, e.g.:
    # sudo ufw allow from 192.168.0.0/16 to any port 8096 proto tcp   # (example: Jellyfin)
    sudo ufw enable
    ```
11. **Backups (cron)** — daily `pg_dump station1_production | gzip` and a nightly
    rsync/tar of `/var/www/station1/shared/storage` to off-box storage.

## Redeploys (Part D)

```bash
/var/www/station1/current/bin/deploy.sh
```

## Verification

- `sudo systemctl status station1` and `... status cloudflared` both active;
  `journalctl -u station1 -f` shows Puma booted.
- Local origin works: `curl -I -H 'Host: station1.me' http://127.0.0.1:8090` → 200/301.
- Public site: `curl -I https://station1.me` → 200 with a valid Cloudflare cert.
- Browse landing page + `/examples`; Tailwind renders (asset precompile worked).
- Sign up / log in (Devise over HTTPS, secure cookie).
- Create a CV at `/forms`, upload a photo → it saves and re-renders.
- Reboot the server → both `station1` and `cloudflared` auto-start (systemd `enable`).
