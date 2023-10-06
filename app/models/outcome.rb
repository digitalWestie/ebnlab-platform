class Outcome < ApplicationRecord
  has_paper_trail

  belongs_to :project
  has_many :evidence_links, as: :evidenceable, dependent: :destroy
  has_many :evidence_items, through: :evidence_links, source: :evidenceable, source_type: 'EvidenceItem'

  validates :name, presence: true
  validates :confidence, numericality: { in: 1..7 }
end
