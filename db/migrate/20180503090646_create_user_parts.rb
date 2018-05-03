class CreateUserParts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_parts do |t|
      t.integer :creator
      t.integer :attendee

      t.timestamps
    end
  end
end
