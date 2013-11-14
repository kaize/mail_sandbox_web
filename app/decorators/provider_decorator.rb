class ProviderDecorator < ApplicationDecorator

  def to_s
    model.class.name.demodulize.downcase
  end

end
