namespace :dev do
  desc "Add dummy data"
  task prime: :environment do
    User.destroy_all
    user = User.create(email: "test@example.com", password: "password")

    Contact.destroy_all
    contacts = []
    20.times do
      contact = {
        name: Faker::Name.name,
        phone_number: Faker::PhoneNumber.cell_phone_in_e164,
        user_id: user.id,
        created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
        updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
      }
      contacts.push contact
    end
    Contact.insert_all! contacts
    messages = []
    # future
    10.times do
      
      message = {
        contact_id: user.contacts.sample.id,
        content: Faker::Quote.famous_last_words,
        message_sent: false,
        send_time: Faker::Time.between(from: DateTime.current, to: DateTime.current + 1.week ),
        created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
        updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
      }
      messages.push message
    end
    Message.insert_all! messages
    messages = []
    # past
    10.times do
      
      message = {
        contact_id: user.contacts.sample.id,
        content: Faker::Quote.famous_last_words,
        message_sent: true,
        send_time: Faker::Time.between(from: DateTime.current - 1.week, to: DateTime.current ),
        created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
        updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
      }
      messages.push message
    end
    Message.insert_all! messages
  end
end
