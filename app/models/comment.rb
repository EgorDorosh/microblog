class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  has_many :marks, as: :markable, dependent: :destroy

  validates :body, presence: true, length: { maximum: 140 }
end
