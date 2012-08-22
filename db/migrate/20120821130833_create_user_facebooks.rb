class CreateUserFacebooks < ActiveRecord::Migration
  def change
    create_table :user_facebook do |t|
      t.references :user
      t.integer :uid

      t.timestamps
    end
    add_index :user_facebook, :user_id
    add_index :user_facebook, :uid
  end
end
