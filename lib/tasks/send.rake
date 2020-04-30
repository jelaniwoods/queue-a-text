namespace :send do
  desc "Send any queue'd messages and mark them as sent."
  task messages: :environment do
    messages = Message.unsent.sendable
    messages.map(&:send)
  end
end
