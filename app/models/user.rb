class User < ActiveRecord::Base
  has_many :events
  has_secure_password
  validates :username, uniqueness: true
 

end