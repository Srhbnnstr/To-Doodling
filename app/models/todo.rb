class Todo < ActiveRecord::Base
  belongs_to :list
  extend SimpleCalendar

end
