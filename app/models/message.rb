# == Schema Information
#
# Table name: messages
#
#  id           :uuid             not null, primary key
#  content      :text
#  message_sent :boolean          default(FALSE)
#  send_time    :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  contact_id   :uuid
#
class Message < ApplicationRecord
  belongs_to :contact
  has_one :user, through: :contact, source: :user
end
