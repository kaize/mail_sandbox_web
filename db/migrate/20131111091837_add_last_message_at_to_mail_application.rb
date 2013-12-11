class AddLastMessageAtToMailApplication < ActiveRecord::Migration
  def change
    add_column :mail_applications, :last_message_at, :datetime
  end
end
