class AddEndTimeToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :end_time, :datetime
  end
end
