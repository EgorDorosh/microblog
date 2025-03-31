class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :status
  belongs_to :actor, polymorphic: true
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(status_id: Status.find_by(name: 'unread').id) }
  scope :read, -> { where(status_id: Status.find_by(name: 'read').id) }

  def mark_as_read
    update(status_id: Status.find_by(name: 'read').id)
  end
end