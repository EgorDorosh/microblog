# frozen_string_literal: true

class HashtagSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :hashtag
end
