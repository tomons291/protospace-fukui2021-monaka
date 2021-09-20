class Prototype < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  
  validates :title, :concept, :catchcopy, :image, presence: true
end
