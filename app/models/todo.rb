class Todo < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  def start_time
          self.todo.date_due ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

end
