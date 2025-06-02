class Hashtag < ApplicationRecord
  validates :name, presence: true, uniqueness: true, format: { without: /\s/ }

  has_many :micropost_hashtags, dependent: :destroy
  has_many :microposts, through: :micropost_hashtags
  has_many :subscriptions, class_name: 'HashtagSubscription', dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user
end
