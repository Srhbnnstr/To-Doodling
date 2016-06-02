class Todo < ActiveRecord::Base
  belongs_to :list
  belongs_to :user
  extend SimpleCalendar
end
