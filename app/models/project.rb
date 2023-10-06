class Project < ApplicationRecord
  belongs_to :organisation
  has_many :problems, dependent: :destroy
  has_many :populations, dependent: :destroy
  has_many :outcomes, dependent: :destroy

  validates :name, presence: true
end
