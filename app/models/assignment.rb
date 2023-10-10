class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :assignable, polymorphic: true

  validates :user, uniqueness: { scope: [:assignable_type, :assignable_id], message: "is already assigned" }
end
