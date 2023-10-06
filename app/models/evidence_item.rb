class EvidenceItem < ApplicationRecord
  has_paper_trail

  has_many :evidence_links, as: :evidenceable, dependent: :destroy
  has_many :populations, through: :evidence_links, source: :evidenceable, source_type: 'Population'
  has_many :projects, through: :evidence_links, source: :evidenceable, source_type: 'Project'
  has_many :problems, through: :evidence_links, source: :evidenceable, source_type: 'Problem'
  #TODO: when model created add needs statement association here
end
