class CreateUserGithubs < ActiveRecord::Migration
  def change
    create_table :user_github do |t|
      t.references :user
      t.string :uid

      t.timestamps
    end
    add_index :user_github, :user_id
    add_index :user_github, :uid
  end
end
