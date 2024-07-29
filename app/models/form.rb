class Form < ApplicationRecord
  # relations
  has_one_attached :photo
  belongs_to :user
end
