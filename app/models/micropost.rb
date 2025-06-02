class Micropost < ApplicationRecord
  belongs_to :user

  has_many :marks, as: :markable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :micropost_hashtags, dependent: :destroy
  has_many :hashtags, through: :micropost_hashtags
  has_many_attached :images

  after_save :process_hashtags

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :validate_images

  private

  def validate_images
    return unless images.attached?

    if images.count > 3
      errors.add(:images, ' count should be less than 4')
    end
  end

  def notify_followers
    user.followers.each { |follower| NotificationsCreator.call(follower, user, self) }
  end

  def process_hashtags
    micropost_hashtags.destroy_all
    hashtags = content.scan(/#\w+/).map { |tag| tag.downcase.delete('#') }

    hashtags.each do |name|
      hashtag = Hashtag.find_or_create_by(name:)
      MicropostHashtag.find_or_create_by(micropost: self, hashtag: hashtag)
      hashtag.subscribers.each do |subscriber|
        unless Notification.exists?(user: subscriber, actor: user, notifiable: self) || user == subscriber
          NotificationsCreator.call(subscriber, user, self)
        end
      end
    end
  end
end
