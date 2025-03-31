class NotificationsCreator
  def self.call(user, actor, notifiable)
    Notification.create(
      user: user,
      actor: actor,
      notifiable: notifiable,
      status_id: Status.find_by(name: 'unread').id
    )
  end
end