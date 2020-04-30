# == Schema Information
#
# Table name: contacts
#
#  id           :uuid             not null, primary key
#  name         :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :uuid
#
class Contact < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
end
