class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :list_title
      t.string :time_frame
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
