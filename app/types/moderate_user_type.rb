class ModerateUserType < UserType
  include ApplicationType
  has_secure_password

  permit :state_event, :email, :password, :password_confirmation, :admin
end
