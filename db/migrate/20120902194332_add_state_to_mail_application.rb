class AddStateToMailApplication < ActiveRecord::Migration
  def change
    add_column :mail_applications, :state, :string
  end
end
