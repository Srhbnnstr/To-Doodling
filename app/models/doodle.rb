class Doodle < ActiveRecord::Base
  belongs_to :user
  belongs_to :list, :counter_cache => true
  attr_accessor :image, :created_at, :updated_at, :svg

end
