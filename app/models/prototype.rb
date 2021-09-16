class Prototype < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :concept, presence: true
  validates :catchcopy, presence: true
  validates :image, presence: true

end
