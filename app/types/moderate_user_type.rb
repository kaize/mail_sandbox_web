class ModerateUserType < UserType
  include BaseType

  attr_accessible :admin, :email, :password
end
