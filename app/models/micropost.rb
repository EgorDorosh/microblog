class Micropost < ApplicationRecord
  belongs_to :user

  has_many :marks, as: :markable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :images

  after_create :notify_followers

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :validate_images

  def notify_followers
    user.followers.each { |follower| NotificationsCreator.call(follower, user, self) }
  end

  private

  def validate_images
    return unless images.attached?

    if images.count > 3
      errors.add(:images, ' count should be less than 4')
    end
  end
end
