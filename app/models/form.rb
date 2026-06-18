class Form < ApplicationRecord
  # relations
  has_one_attached :photo
  belongs_to :user

  has_many :experiences,    -> { order(:position, :id) }, dependent: :destroy
  has_many :educations,     -> { order(:position, :id) }, dependent: :destroy
  has_many :skills,         -> { order(:position, :id) }, dependent: :destroy
  has_many :languages,      -> { order(:position, :id) }, dependent: :destroy
  has_many :cv_references,  -> { order(:position, :id) }, dependent: :destroy
  has_many :certifications, -> { order(:position, :id) }, dependent: :destroy

  accepts_nested_attributes_for :experiences, :educations, :skills, :languages,
                                :cv_references, :certifications,
                                allow_destroy: true, reject_if: :all_blank

  enum template: { default: 0, special: 1, designer: 2, minimal: 3, sales: 4 }
end
