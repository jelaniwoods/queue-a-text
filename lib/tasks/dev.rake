namespace :dev do
  desc "Add dummy data"
  task prime: :environment do
    user = User.create(email: "text@example.com", password: "password")
  end
end
