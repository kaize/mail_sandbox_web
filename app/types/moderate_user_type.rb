class ModerateUserType < UserType
  include ApplicationType

  permit :state_event, :email, :password, :admin

end
