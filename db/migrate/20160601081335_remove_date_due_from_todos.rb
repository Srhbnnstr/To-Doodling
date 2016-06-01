class RemoveDateDueFromTodos < ActiveRecord::Migration
  def change
    remove_column :todos, :date_due, :datetime
  end
end
