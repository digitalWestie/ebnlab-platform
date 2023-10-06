class Population < ApplicationRecord
  has_paper_trail

  belongs_to :project

  validates :name, presence: true
  validates :confidence, numericality: { in: 1..7 }
end
