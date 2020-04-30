class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages, id: :uuid  do|t|
      t.text :content
      t.datetime :time_send
      t.boolean :message_sent
      t.uuid :contact_id

      t.timestamps
    end
  end
end
