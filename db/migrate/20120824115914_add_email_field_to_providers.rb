class AddEmailFieldToProviders < ActiveRecord::Migration
  def change
    add_column :user_facebook, :email, :string
    add_column :user_github, :email, :string
  end
end
