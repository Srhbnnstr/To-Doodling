class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.integer :user_id
      t.integer :list_id
      t.datetime :date_due
      t.datetime :time_due

      t.timestamps null: false
    end
  end
end
