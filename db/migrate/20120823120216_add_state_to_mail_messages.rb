class AddStateToMailMessages < ActiveRecord::Migration
  def change
    add_column :mail_messages, :state, :string
  end
end
