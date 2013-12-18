class CreateUserAuthentications < ActiveRecord::Migration
  def change
    create_table :user_authentications do |t|
      t.references :user, index: true
      t.string :uid
      t.string :provider
      t.string :nickname

      t.timestamps
    end
  end
end
