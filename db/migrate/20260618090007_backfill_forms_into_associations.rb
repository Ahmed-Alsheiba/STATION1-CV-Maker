class BackfillFormsIntoAssociations < ActiveRecord::Migration[7.0]
  # Inline models, namespaced under this migration, so the backfill does not
  # depend on the live app models (whose flat columns are dropped in the next
  # migration) and won't break if those models change later.
  class Form < ActiveRecord::Base
    self.table_name = "forms"
  end

  class Education < ActiveRecord::Base
    self.table_name = "educations"
  end

  class Skill < ActiveRecord::Base
    self.table_name = "skills"
  end

  class Language < ActiveRecord::Base
    self.table_name = "languages"
  end

  class Experience < ActiveRecord::Base
    self.table_name = "experiences"
  end

  class CvReference < ActiveRecord::Base
    self.table_name = "cv_references"
  end

  def up
    Form.reset_column_information

    Form.find_each do |form|
      if form.degree.present? || form.college.present?
        Education.create!(
          form_id: form.id,
          degree: form.degree,
          institution: form.college,
          start_date: form.degree_starting_year&.to_s,
          end_date: form.degree_finishing_year&.to_s,
          position: 0
        )
      end

      form.skills.to_s.split(",").map(&:strip).reject(&:blank?).each_with_index do |name, i|
        Skill.create!(form_id: form.id, name: name, position: i)
      end

      form.languages.to_s.split(",").map(&:strip).reject(&:blank?).each_with_index do |name, i|
        Language.create!(form_id: form.id, name: name, position: i)
      end

      if form.prev_job_title.present? || form.prev_company.present? || form.about_prev_job.present?
        Experience.create!(
          form_id: form.id,
          job_title: form.prev_job_title,
          company: form.prev_company,
          location: form.prev_company_address,
          start_date: form.prev_job_starting_year&.to_s,
          end_date: form.prev_job_ending_year&.to_s,
          description: form.about_prev_job,
          position: 0
        )
      end

      if form.ref_name.present? || form.ref_email.present? || form.ref_phone.present?
        CvReference.create!(
          form_id: form.id,
          name: form.ref_name,
          email: form.ref_email,
          phone: form.ref_phone,
          position: 0
        )
      end
    end
  end

  def down
    [Education, Skill, Language, Experience, CvReference].each(&:delete_all)
  end
end
