class AddMailApplicationIndexToMailMessage < ActiveRecord::Migration
  def change
    add_index :mail_messages, :mail_application_id
  end
end
