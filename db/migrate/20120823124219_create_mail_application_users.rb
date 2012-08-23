class CreateMailApplicationUsers < ActiveRecord::Migration
  def change
    create_table :mail_application_users do |t|
      t.integer :mail_application_id
      t.integer :user_id

      t.timestamps
    end
  end
end
