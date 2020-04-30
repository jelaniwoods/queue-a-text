# == Schema Information
#
# Table name: messages
#
#  id           :uuid             not null, primary key
#  content      :text
#  message_sent :boolean
#  time_send    :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  contact_id   :uuid
#
class Message < ApplicationRecord
end
