class Micropost < ApplicationRecord
  belongs_to :user

  has_many :marks, as: :markable, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_create :notify_followers

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def notify_followers
    user.followers.each { |follower| NotificationsCreator.call(follower, user, self) }
  end
end
