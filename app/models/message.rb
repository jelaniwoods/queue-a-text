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
  
  scope :unsent, -> { where(message_sent: false) }

  # TODO use Twilio send code
  def send
    unless message_sent
      contact.phone_number
      update(message_sent: true)
    end
  end

end
