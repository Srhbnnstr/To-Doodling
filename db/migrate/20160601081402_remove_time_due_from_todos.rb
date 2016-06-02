class RemoveTimeDueFromTodos < ActiveRecord::Migration
  def change
    remove_column :todos, :time_due, :datetime
  end
end
