class AddMailApplicationToMailMessage < ActiveRecord::Migration
  def change
    add_column :mail_messages, :mail_application_id, :integer
  end
end
