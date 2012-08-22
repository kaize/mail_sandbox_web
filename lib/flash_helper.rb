module FlashHelper
  def flash_translate(key, options = {})
    scope = [:flash, :controllers]
    scope += params[:controller].split('/')
    scope << params[:action]

    t(key, {:scope => scope}.merge(options))
  end
end
