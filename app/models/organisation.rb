class Organisation < ApplicationRecord
  has_many :projects, dependent: :destroy

  validates :name, presence: true
end
