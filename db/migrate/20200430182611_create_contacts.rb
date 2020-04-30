class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts, id: :uuid do |t|
      t.string :name
      t.string :phone_number
      t.uuid :user_id

      t.timestamps
    end
  end
end
