class AddStartTimeToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :start_time, :datetime
  end
end
