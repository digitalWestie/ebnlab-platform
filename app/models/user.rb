class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :assignments, dependent: :destroy
  has_many :projects, through: :assignments, source: :assignable, source_type: "Project"
  has_many :organisations, through: :assignments, source: :assignable, source_type: "Organisation"

end
