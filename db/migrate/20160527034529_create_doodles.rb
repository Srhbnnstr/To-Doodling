class CreateDoodles < ActiveRecord::Migration
  def change
    create_table :doodles do |t|
      t.json :image
      t.string :note
      t.integer :user_id
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
