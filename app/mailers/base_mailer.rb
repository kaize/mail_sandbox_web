class BaseMailer < ActionMailer::Base
  default :from => configus.emails.sender_email
  default_url_options[:host] = configus.host

  #def url_options
    #super.merge(:locale => (I18n.locale == I18n.default_locale ? nil : I18n.locale))
  #end
end
