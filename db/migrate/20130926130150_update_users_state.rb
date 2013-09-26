class UpdateUsersState < ActiveRecord::Migration
  def up
    User.update_all state: "active"
  end

  def down
    User.update_all state: nil
  end
end
