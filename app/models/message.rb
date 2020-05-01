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

  validates :send_time, presence: true
  validates :contact, presence: true
  validates :content, presence: true

  scope :unsent, -> { where(message_sent: false) }
  scope :sent, -> { where(message_sent: true) }
  scope :upcoming, -> { where(send_time: Date.current..).order(send_time: :asc) }
  scope :sendable, -> { where(send_time: (DateTime.current - 10.minutes)..(DateTime.current + 10.minutes)) }

  # TODO add time zones
  def send_message
    unless message_sent
      twilio_client.messages.create(
        from: ENV.fetch("TWILIO_PHONE_NUMBER"),
        to: contact.phone_number,
        body: content,
      )
      update(message_sent: true)
    end
  end

  private

  def twilio_client
    twilio_account_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
    twilio_auth_token = ENV.fetch("TWILIO_AUTH_TOKEN")
    client = Twilio::REST::Client.new twilio_account_sid, twilio_auth_token
  end
end
