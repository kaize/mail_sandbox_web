module Web::UsersHelper

  def provider_image(*args)
    provider = args.first
    options = args.extract_options!
    provider_path = "providers/#{provider.to_s}.png"
    image_tag(provider_path, options)
  end
end
