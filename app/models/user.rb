class User < ActiveRecord::Base
  # attr_accessible :title, :body

  def guest?
    false
  end
end
