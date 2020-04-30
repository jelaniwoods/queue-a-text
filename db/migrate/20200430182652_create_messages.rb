class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.text :content
      t.datetime :send_time
      t.boolean :message_sent, default: false
      t.uuid :contact_id

      t.timestamps
    end
  end
end
