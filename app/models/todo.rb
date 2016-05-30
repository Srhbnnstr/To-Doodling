class Todo < ActiveRecord::Base
  belongs_to :list
  include SimpleCalendar
  

end
