class Organisation < ApplicationRecord
  has_many :projects, dependent: :destroy

  has_many :assignments, as: :assignable, dependent: :destroy
  has_many :users, through: :assignments

  validates :name, presence: true
end
