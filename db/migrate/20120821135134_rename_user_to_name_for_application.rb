class RenameUserToNameForApplication < ActiveRecord::Migration
  def change
    rename_column :mail_applications, :user, :name
  end
end
