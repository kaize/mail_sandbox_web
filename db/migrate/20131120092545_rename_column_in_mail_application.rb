class RenameColumnInMailApplication < ActiveRecord::Migration
  def change
    rename_column :mail_applications, :owner_id, :creator_id
  end
end
