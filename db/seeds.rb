# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create Users
user1 = User.create!(
  email: "emma@example.com",
  password: "password1",
  first_name: "Emma",
  last_name: "Williams",
  phone: "1234567890",
  address: "123 Main St"
)

user2 = User.create!(
  email: "liam@example.com",
  password: "password2",
  first_name: "Liam",
  last_name: "Brown",
  phone: "0987654321",
  address: "456 Elm St"
)

# Create Forms
Form.create!(
  user: user1,
  first_name: "Alice",
  last_name: "Smith",
  phone: "1234567890",
  email: "alice@example.com",
  address: "123 Main St",
  degree: "BSc Computer Science",
  college: "Tech University",
  degree_starting_year: 2015,
  degree_finishing_year: 2019,
  skills: "Ruby, Rails, JavaScript",
  languages: "English, French",
  prev_job_title: "Developer",
  prev_company: "Acme Corp",
  prev_company_address: "789 Oak Ave",
  prev_job_starting_year: 2019,
  prev_job_ending_year: 2022,
  about_prev_job: "Worked on web applications. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  about_you: "Passionate developer. Team player. Quick learner. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  ref_name: "Jane Doe",
  ref_email: "jane@example.com",
  ref_phone: "5551234567"
)

Form.create!(
  user: user2,
  first_name: "Bob",
  last_name: "Johnson",
  phone: "0987654321",
  email: "bob@example.com",
  address: "456 Elm St",
  degree: "BA Design",
  college: "Art College",
  degree_starting_year: 2014,
  degree_finishing_year: 2018,
  skills: "Photoshop, Illustrator",
  languages: "English, Spanish",
  prev_job_title: "Designer",
  prev_company: "Design Studio",
  prev_company_address: "321 Pine Rd",
  prev_job_starting_year: 2018,
  prev_job_ending_year: 2021,
  about_prev_job: "Designed marketing materials.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  about_you: "Creative and detail-oriented.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  ref_name: "John Smith",
  ref_email: "john@example.com",
  ref_phone: "5559876543"
)
Form.create!(
  user: user1,
  first_name: "Alice",
  last_name: "Smith",
  phone: "1234567890",
  email: "alice@example.com",
  address: "123 Main St",
  degree: "MSc Data Science",
  college: "Tech University",
  degree_starting_year: 2019,
  degree_finishing_year: 2021,
  skills: "Python, Machine Learning, SQL",
  languages: "English, French",
  prev_job_title: "Data Analyst",
  prev_company: "DataCorp",
  prev_company_address: "101 Maple St",
  prev_job_starting_year: 2021,
  prev_job_ending_year: 2023,
  about_prev_job: "Analyzed large datasets and built predictive models. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  about_you: "Data enthusiast with strong analytical skills.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  ref_name: "Emily White",
  ref_email: "emily@example.com",
  ref_phone: "5552223333"
)

Form.create!(
  user: user2,
  first_name: "Bob",
  last_name: "Johnson",
  phone: "0987654321",
  email: "bob@example.com",
  address: "456 Elm St",
  degree: "MA Fine Arts",
  college: "Art College",
  degree_starting_year: 2018,
  degree_finishing_year: 2020,
  skills: "Painting, Sculpture",
  languages: "English, Spanish",
  prev_job_title: "Art Instructor",
  prev_company: "Creative Arts Center",
  prev_company_address: "202 Birch Blvd",
  prev_job_starting_year: 2020,
  prev_job_ending_year: 2022,
  about_prev_job: "Taught art classes and curated exhibitions. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  about_you: "Experienced artist and educator. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  ref_name: "Sarah Green",
  ref_email: "sarah@example.com",
  ref_phone: "5554445555"
)
