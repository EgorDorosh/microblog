class Mark < ApplicationRecord
  belongs_to :markable, polymorphic: true, optional: true

  validates :mark_type, inclusion: { in: %w[like dislike] }
  validates :user_id, uniqueness: { scope: [:markable_type, :markable_id] }

  scope :like, -> { where(mark_type: 'like') }
  scope :dislike, -> { where(mark_type: 'dislike') }

  def like?
    mark_type == 'like'
  end

  def dislike?
    mark_type == 'dislike'
  end
end
