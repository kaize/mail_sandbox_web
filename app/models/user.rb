class User < ActiveRecord::Base
  include UserRepository
  has_one :facebook, :dependent => :destroy, :autosave => true
  has_one :github, :dependent => :destroy, :autosave => true

  def guest?
    false
  end

  def providers
    [self.facebook,
     self.github].compact
  end
end
