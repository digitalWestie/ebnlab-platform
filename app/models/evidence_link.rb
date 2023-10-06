class EvidenceLink < ApplicationRecord
  has_paper_trail

  belongs_to :evidenceable, polymorphic: true
  belongs_to :evidence_item
end
