module Web::User::SessionsHelper

  def login_button(provider)
    link_to register_with_cpath(provider), :class => "btn", target: "_self" do
      ret = ""
      ret << provider_image(provider)
      ret << t(".#{provider}")
      ret.html_safe
    end
  end
end
