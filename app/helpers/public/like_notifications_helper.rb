module Public::LikeNotificationsHelper
  module NotificationsHelper
  def unchecked_notifications
    @notifications = current_member.passive_notifications.where(checked: false)
  end
end
end
