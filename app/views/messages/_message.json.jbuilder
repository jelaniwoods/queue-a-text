json.extract! message, :id, :content, :time_send, :message_sent, :contact_id, :created_at, :updated_at
json.url message_url(message, format: :json)
