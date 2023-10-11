class Assignment < ApplicationRecord

  ROLES = ["collaborator", "admin"].freeze

  belongs_to :user
  belongs_to :assignable, polymorphic: true

  validates :user, uniqueness: { scope: [:assignable_type, :assignable_id], message: "is already assigned" }

  ROLES.each do |role|
    define_method("is_#{role}?") do
      self.role == role
    end
  end

  def next_role
    role_idx = Assignment::ROLES.index(self.role)
    role_idx += 1
    role_idx = role_idx % Assignment::ROLES.size
    Assignment::ROLES[role_idx]
  end
end
