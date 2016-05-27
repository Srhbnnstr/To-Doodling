class User < ActiveRecord::Base
  has_many :lists
  has_many :doodles
  has_secure_password
end
