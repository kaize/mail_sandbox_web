class AddCreatorToMailApplicationUsers < ActiveRecord::Migration
  def change
    add_column :mail_application_users, :creator, :boolean
  end
end
