class AddNicknameToProviders < ActiveRecord::Migration
  def change
    add_column :user_facebook, :nickname, :string
    add_column :user_github, :nickname, :string
  end
end
