class Project < ApplicationRecord
  belongs_to :organisation
  has_many :assignments, as: :assignable, dependent: :destroy
  has_many :users, through: :assignments

  has_many :problems, dependent: :destroy
  has_many :populations, dependent: :destroy
  has_many :outcomes, dependent: :destroy

  validates :name, presence: true

  def evidence_items
    #TODO a select that returns evidence items across the project
    nil
  end
end
