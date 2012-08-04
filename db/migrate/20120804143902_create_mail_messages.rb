class CreateMailMessages < ActiveRecord::Migration
  def change
    create_table :mail_messages do |t|
      t.string :recipient, :sender
      t.text :data
      t.datetime :completed_at

      t.timestamps
    end
  end
end
