class NotificationsController < ApplicationController
  before_action :logged_in_user

  def index
    @notifications = current_user.notifications.order(created_at: :desc)
    current_user.notifications.unread.update_all(status_id: Status.find_by(name: 'read').id)
  end
end
