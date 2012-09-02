class ModerateUserType < User
  include BaseType

  attr_accessible :admin
end
