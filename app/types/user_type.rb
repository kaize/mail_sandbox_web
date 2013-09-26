class UserType < User
  include BaseType

  attr_accessible :admin, :email, :password
end
