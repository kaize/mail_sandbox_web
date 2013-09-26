class BaseMailer < ActionMailer::Base
  default :from => configus.emails.sender_email

  def url_options
    super.merge(:locale => (I18n.locale == I18n.default_locale ? nil : I18n.locale))
  end
end
