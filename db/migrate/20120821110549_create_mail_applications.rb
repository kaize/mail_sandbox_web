class CreateMailApplications < ActiveRecord::Migration
  def change
    create_table :mail_applications do |t|
      t.string :user
      t.string :password

      t.timestamps
    end
  end
end
