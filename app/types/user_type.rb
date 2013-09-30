class UserType < User
  include ApplicationType

  attr_accessible :admin, :email, :password
  permit :admin, :email, :password
end
