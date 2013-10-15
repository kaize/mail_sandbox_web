class FacebookType < User::Facebook
  include BaseType

  permit :uid
end