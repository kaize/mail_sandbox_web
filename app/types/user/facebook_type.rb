class FacebookType < User::Facebook
  include ApplicationType

  permit :uid
end