class AddOwinerIdToMailApplication < ActiveRecord::Migration
  def change
    add_column :mail_applications, :owner_id, :integer
  end
end
