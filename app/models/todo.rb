class Todo < ActiveRecord::Base
  belongs_to :list
  extend SimpleCalendar
  has_calendar attribute: :due_date
end
