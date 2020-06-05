class User < ActiveRecord::Base
  has_many :events
  has_secure_password
  validates :username, uniqueness: true

  def slug
    username.parameterize
  end

  def self.find_by_slug(slug)
    self.all.detect {|user| user.slug == slug}
  end
 

end