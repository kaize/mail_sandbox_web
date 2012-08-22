class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :facebook, :dependent => :destroy, :autosave => true

  def guest?
    false
  end
end
