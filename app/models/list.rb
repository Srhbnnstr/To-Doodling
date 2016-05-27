class List < ActiveRecord::Base
  belongs_to :user
  has_many :todos
  has_many :doodles
end
