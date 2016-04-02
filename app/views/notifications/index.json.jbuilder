json.array! @notifications do |notification|
  json.actor notification.actor.first_name
  json.action notification.action
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  if notification.notifiable.class.to_s == 'Comment'
  question = Comment.find_by(id: notification.notifiable).question
  json.url question_path(question, anchor: dom_id(notification.notifiable))
  end
  if notification.notifiable.class.to_s == 'Question'
    json.url question_path(notification.notifiable)
  end
end