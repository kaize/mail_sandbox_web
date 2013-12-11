class AddSubjectToMailMessage < ActiveRecord::Migration
  def change
    add_column :mail_messages, :subject, :text
  end
end
