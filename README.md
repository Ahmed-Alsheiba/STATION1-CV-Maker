<div align="center">

# STATION1 — CV Maker

**Create polished, print-ready CVs in minutes — pick a template, fill a guided form, and export.**

[![Live Demo](https://img.shields.io/badge/Live_Demo-station1.me-2ea44f?style=for-the-badge&logo=cloudflare&logoColor=white)](https://station1.me)

![Ruby](https://img.shields.io/badge/Ruby-3.4.6-CC342D?logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/Rails-7.0-CC0000?logo=rubyonrails&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=white)
![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?logo=tailwindcss&logoColor=white)
![Hotwire](https://img.shields.io/badge/Hotwire-Turbo_%26_Stimulus-5A2D91)

[**Live site →**](https://station1.me) · [Features](#features) · [Tech Stack](#tech-stack) · [Getting Started](#getting-started) · [Architecture](#architecture--deployment)

</div>

---

## Overview

STATION1 is a full-stack Ruby on Rails application for building professional CVs and résumés. Users sign up, complete a guided multi-section form, choose from several visual templates, and produce a clean, print-ready document. The app is responsive across mobile and desktop, and is self-hosted in production behind a Cloudflare Tunnel.

🔗 **Try it live: [station1.me](https://station1.me)**

## Features

- **Guided CV builder** — a single, structured form captures profile details, a personal summary, and all résumé sections.
- **Dynamic multi-entry sections** — add or remove as many entries as needed for **Work Experience**, **Education**, **Skills**, **Languages**, **Certifications**, and **References**, with ordered positioning. Built on Rails nested attributes with add/remove handled by Hotwire.
- **Proficiency levels** — skills and languages support level ratings for a richer, more visual résumé.
- **Five CV templates** — `default`, `special`, `designer`, `minimal`, and `sales`, switchable per CV so users can preview different looks from the same data.
- **Profile photo uploads** — image attachments via Active Storage.
- **Print-ready output** — a dedicated view and print action produce a clean PDF-style document straight from the browser.
- **Example gallery** — a curated showcase of example CVs for inspiration on the landing experience.
- **User accounts** — registration, login, and account management via Devise.
- **Responsive UI** — Tailwind CSS, mobile-first.

## Tech Stack

| Layer | Technologies |
|-------|--------------|
| **Backend** | Ruby 3.4.6, Ruby on Rails 7.0.8 |
| **Database** | PostgreSQL |
| **Frontend** | Hotwire (Turbo + Stimulus), Import Maps (no Node build step), Tailwind CSS, Dart Sass, Sprockets |
| **Auth** | Devise |
| **File storage** | Active Storage (local disk) |
| **Server** | Puma |
| **Testing** | Capybara + Selenium (system tests) |
| **Infrastructure** | Nginx, systemd, Cloudflare Tunnel (self-hosted) |

## Getting Started

### Prerequisites
- Ruby **3.4.6** (see `.ruby-version`)
- PostgreSQL
- Bundler

### Local setup
```bash
# 1. Clone
git clone https://github.com/Ahmed-Alshaiba/STATION1---CV-Maker.git
cd STATION1---CV-Maker

# 2. Install gems
bundle install

# 3. Set up the database
bin/rails db:create db:migrate

# 4. Run the app (starts Rails + Tailwind + Dart Sass watchers)
bin/dev
```
Then open **http://localhost:3000**.

> No Node.js toolchain is required — JavaScript is delivered via import maps and CSS via the standalone Tailwind and Dart Sass binaries. Production secrets are managed with encrypted Rails credentials and are not part of the repository.

## Architecture & Deployment

The production site runs **self-hosted** rather than on a managed PaaS, which keeps it cost-free and fully under control:

```
Browser ──HTTPS──> Cloudflare (edge TLS) ──tunnel──> cloudflared
                                                          │
                                                       Nginx ──> Puma (unix socket) ──> Rails 7
                                                                                            ├── PostgreSQL
                                                                                            └── Active Storage (disk)
```

- **Cloudflare Tunnel** exposes the app with no port-forwarding, no static public IP, and automatic edge TLS.
- **Nginx** serves static assets and reverse-proxies to **Puma** over a Unix socket.
- **systemd** supervises the app and tunnel processes and restarts them on boot/failure.
- **PostgreSQL** runs locally; uploads live on a persistent disk path with scheduled database + file backups.

## Data Model

A `Form` represents one CV and belongs to a `User`. Each form `has_many` ordered entries across six sections:

```
User ──< Form ──< Experience
                ├─< Education
                ├─< Skill        (with level)
                ├─< Language     (with level)
                ├─< Certification
                └─< CvReference
       Form has_one_attached :photo   ·   Form.template ∈ {default, special, designer, minimal, sales}
```

## Author

**Ahmed Alshaiba** — [GitHub](https://github.com/Ahmed-Alsheiba)

<div align="center">

⭐ If you find this project interesting, consider giving it a star.

</div>
