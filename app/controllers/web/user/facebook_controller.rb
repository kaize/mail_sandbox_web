class Web::User::FacebookController < Web::User::NetworksController
  def callback
    attrs = ActionController::Parameters.new auth_hash[:info]
    authentication = ::User::Authentication.where(auth_hash.extract(:provider, :uid)).first_or_initialize
    authentication.nickname = auth_hash[:info][:nickname]

    if authentication.persisted?
      user = authentication.user
    else
      user = User::FacebookType.where(attrs.extract('email'))
        .first_or_create(attrs)
      user.authentications << authentication
    end

    if user.waiting_confirmation?
      user.confirm!
    end

    if user.active?
      sign_in user
      f(:success)
    else
      f(:error)
    end

    redirect_to :root
  end
end
