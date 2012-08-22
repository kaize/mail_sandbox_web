class ChangeFacebookUserUid < ActiveRecord::Migration
  def change
    change_column :user_facebook, :uid, :string
  end
end
