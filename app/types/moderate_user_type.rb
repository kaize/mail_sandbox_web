class ModerateUserType < UserType
  include ApplicationType

  attr_accessible :state_event, :email, :password, :admin
  permit :state_event, :email, :password, :admin
end
