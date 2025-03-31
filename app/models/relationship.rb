class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  after_create :notify_followers

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  def notify_followers
    NotificationsCreator.call(followed, follower, self)
  end
end
