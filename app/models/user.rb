class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :prototypes
  has_many :comments

  validates :name, :profile, :affiliation, :position, presence: true
end
