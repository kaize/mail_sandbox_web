class UserType < User
  include ApplicationType

  permit :admin, :email, :password
end
