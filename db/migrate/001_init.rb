class Init < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :from
      t.text :message
      t.datetime :sent_timestamp
      t.string :message_id
      t.string :sent_to
      t.string :device_id
      t.string :address
      
      t.timestamps
    end
  end
end
