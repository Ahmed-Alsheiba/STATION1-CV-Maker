# Seeds the database with example users and one CV per template.
# Re-runnable: users are found-or-created and the seeded example CVs are keyed
# by unique emails and rebuilt on each run (other forms are left untouched).

user1 = User.find_or_create_by!(email: "emma@example.com") do |u|
  u.password = "password1"
  u.first_name = "Emma"
  u.last_name  = "Williams"
  u.phone      = "1234567890"
  u.address    = "123 Main St"
end

user2 = User.find_or_create_by!(email: "liam@example.com") do |u|
  u.password = "password2"
  u.first_name = "Liam"
  u.last_name  = "Brown"
  u.phone      = "0987654321"
  u.address    = "456 Elm St"
end

SEED_EMAILS = %w[
  jane.default@example.com mark.special@example.com
  korina@example.com sebastian@example.com donna@example.com
]
Form.where(email: SEED_EMAILS).destroy_all

# ── Default template ─────────────────────────────────────────────
Form.create!(
  user: user1, template: :default,
  first_name: "Jane", last_name: "Doe",
  email: "jane.default@example.com", phone: "+1 555 0100", address: "123 Anywhere St., Any City",
  about_you: "Versatile professional with a track record of delivering results across product and operations roles.",
  educations_attributes: [
    { degree: "BSc Computer Science", institution: "Tech University", start_date: "2015", end_date: "2019", position: 0 }
  ],
  skills_attributes: [
    { name: "Ruby on Rails", position: 0 }, { name: "JavaScript", position: 1 }, { name: "SQL", position: 2 }
  ],
  languages_attributes: [
    { name: "English", position: 0 }, { name: "French", position: 1 }
  ],
  experiences_attributes: [
    { job_title: "Software Developer", company: "Acme Corp", location: "Remote",
      start_date: "2019", end_date: "2024",
      description: "Built and maintained customer-facing web applications and internal tooling.", position: 0 }
  ],
  cv_references_attributes: [
    { name: "John Smith", title: "Engineering Manager", company: "Acme Corp", email: "john@example.com", phone: "555-1234", position: 0 }
  ]
)

# ── Special template ─────────────────────────────────────────────
Form.create!(
  user: user2, template: :special,
  first_name: "Mark", last_name: "Reed",
  email: "mark.special@example.com", phone: "+1 555 0123", address: "456 Elm St., Any City",
  about_you: "Operations lead focused on process, people and measurable improvement.",
  educations_attributes: [
    { degree: "BA Business Administration", institution: "State University", start_date: "2012", end_date: "2016", position: 0 }
  ],
  skills_attributes: [
    { name: "Project Management", position: 0 }, { name: "Budgeting", position: 1 }, { name: "Leadership", position: 2 }
  ],
  languages_attributes: [
    { name: "English", position: 0 }, { name: "German", position: 1 }
  ],
  experiences_attributes: [
    { job_title: "Operations Manager", company: "Globex", location: "New York",
      start_date: "2018", end_date: "Present",
      description: "Led a team of 12 and cut fulfillment time by 30%.", position: 0 }
  ],
  cv_references_attributes: [
    { name: "Sara Lin", title: "Director", company: "Globex", email: "sara@example.com", phone: "555-7788", position: 0 }
  ]
)

# ── Designer template (White & Beige Minimalist) ─────────────────
Form.create!(
  user: user1, template: :designer,
  first_name: "Korina", last_name: "Villanueva",
  email: "korina@example.com", phone: "+123-456-7890", address: "123 Anywhere St., Any City",
  about_you: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet sem nec risus egestas accumsan. In enim nunc, tincidunt ut quam eget, luctus sollicitudo neque.",
  educations_attributes: [
    { degree: "Bachelor of Design", institution: "Really Great University", start_date: "2012", end_date: "2016", position: 0 },
    { degree: "Master of Design", institution: "Really Great University", start_date: "2016", end_date: "2020", position: 1 }
  ],
  skills_attributes: [
    { name: "Organized", level: 5, position: 0 },
    { name: "Communication", level: 4, position: 1 },
    { name: "Teamwork", level: 4, position: 2 },
    { name: "Meeting deadlines", level: 3, position: 3 },
    { name: "Critical thinking", level: 4, position: 4 }
  ],
  languages_attributes: [
    { name: "French", level: 3, position: 0 },
    { name: "English", level: 5, position: 1 },
    { name: "Spanish", level: 2, position: 2 }
  ],
  experiences_attributes: [
    { job_title: "Graphic Designer", company: "Aldenaire & Partners", start_date: "Jan 2021", end_date: "Mar 2022",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet sem nec risus egestas accumsan.", position: 0 },
    { job_title: "Graphic Designer", company: "Warner & Spencer", start_date: "Jan 2020", end_date: "Dec 2020",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet sem nec risus egestas accumsan.", position: 1 },
    { job_title: "Graphic Designer", company: "Ingoude Company", start_date: "Jan 2017", end_date: "Dec 2019",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet sem nec risus egestas accumsan.", position: 2 }
  ],
  cv_references_attributes: [
    { name: "Alfredo Torres", title: "Director", company: "Aldenaire & Partners", phone: "+123-456-7890", position: 0 }
  ]
)

# ── Minimal template (Clean Real Estate) ─────────────────────────
Form.create!(
  user: user2, template: :minimal,
  first_name: "Sebastian", last_name: "Bennett",
  email: "sebastian@example.com", phone: "123-456-7890", address: "123 Anywhere St., Any City",
  about_you: "I am an experienced Real Estate Agent with a passion for helping clients find their dream homes. I have extensive experience in the industry, including more than 5 years working as a real estate agent. I am knowledgeable about the latest market trends and understand the nuances of the real estate market. I pride myself on my ability to negotiate the best deals for my clients and to navigate complex real estate agreements. I am highly organized, detail-oriented, and have strong communication skills.",
  educations_attributes: [
    { degree: "B.A. in Business Administration", institution: "University", start_date: "2010", end_date: "2014", position: 0 }
  ],
  certifications_attributes: [
    { name: "Licensed Real Estate Agent", position: 0 },
    { name: "Certified Real Estate Negotiator", position: 1 },
    { name: "Top Sales Agent Award 2016", position: 2 }
  ],
  skills_attributes: [
    { name: "Knowledge of the local real estate market", position: 0 },
    { name: "Communication skills", position: 1 },
    { name: "Negotiation skills", position: 2 },
    { name: "Problem-solving skills", position: 3 },
    { name: "Organization and time management skills", position: 4 }
  ],
  experiences_attributes: [
    { job_title: "Real Estate Agent", company: "Really Great Company", start_date: "June 2015", end_date: "Present",
      description: "Negotiate contracts and complex real estate transactions\nProvide excellent customer service to clients\nUpdate and maintain client files\nResearch and monitor the local real estate market\nDevelop marketing campaigns for properties\nUtilize social media platforms to market properties\nParticipate in open houses and home tours", position: 0 },
    { job_title: "Real Estate Agent", company: "Really Great Company", start_date: "June 2014", end_date: "2015",
      description: "Prepared contracts and documents for transactions\nConducted market research on local real estate trends\nCompiled property information and photos\nManaged client database and contact information\nScheduled property tours and open houses", position: 1 }
  ]
)

# ── Sales template (Simple Sales Representative) ─────────────────
Form.create!(
  user: user1, template: :sales,
  first_name: "Donna", last_name: "Stroupe",
  email: "donna@example.com", phone: "+123-456-7890", address: "123 Anywhere St., Any City",
  about_you: "I am a Sales Representative who is a professional who initializes and manages relationships with customers. They serve as the point of contact and lead from initial outreach through the making of the final purchase by them or someone in their household.",
  educations_attributes: [
    { degree: "BA Sales and Commerce", institution: "Wardiere University", start_date: "2011", end_date: "2015", position: 0 },
    { degree: "BA Sales and Commerce", institution: "Wardiere University", start_date: "2011", end_date: "2015", position: 1 }
  ],
  skills_attributes: [
    { name: "Fast-moving Consumer Goods", position: 0 },
    { name: "Packaged Consumer Goods Sales", position: 1 },
    { name: "Corporate sales account management", position: 2 },
    { name: "Experience in retail", position: 3 }
  ],
  languages_attributes: [
    { name: "English", position: 0 }, { name: "French", position: 1 }
  ],
  experiences_attributes: [
    { job_title: "Consumer Goods Seller", company: "Timmerman Industries", start_date: "Aug 2018", end_date: "Present",
      description: "Offer consumer goods packages to corporate and clients\nMeet with clients every quarter to update or renew services\nTrain junior sales agents", position: 0 },
    { job_title: "FMCG Sales Agent", company: "Timmerman Industries", start_date: "Jul 2015", end_date: "Aug 2018",
      description: "Visited corporate client offices to offer latest products\nBuilt relationships with clients to maintain sales goals and create new opportunities", position: 1 },
    { job_title: "Sales Agent", company: "Timmerman Industries", start_date: "Aug 2014", end_date: "Jul 2015",
      description: "Visited corporate client offices to offer latest products", position: 2 }
  ],
  cv_references_attributes: [
    { name: "Estelle Darcy", title: "CEO", company: "Wardiere Inc.", phone: "+123-456-7890", email: "hello@reallygreatsite.com", position: 0 },
    { name: "Harper Russo", title: "CEO", company: "Wardiere Inc.", phone: "+123-456-7890", email: "hello@reallygreatsite.com", position: 1 }
  ]
)

puts "Seeded #{Form.where(email: SEED_EMAILS).count} example CVs (one per template)."
