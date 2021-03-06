class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
              message: "must be a valid image format" },
              size:{ less_than: 7.megabytes,
              message:"should be less than 7MB" }
  def display_image
    image.variant(resize_to_limit: [240, 240])
  end
end
