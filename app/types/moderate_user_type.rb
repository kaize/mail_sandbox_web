class ModerateUserType < UserType
  include ApplicationType

  attr_accessible :state_event
  permit :state_event
end
