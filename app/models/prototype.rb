class Prototype < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :concept, presence: true
  validates :catchcopy, presence: true
  validates :image, presence: true

  validates :prototype, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
