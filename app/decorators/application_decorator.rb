class ApplicationDecorator < Draper::Base
  include Draper::LazyHelpers

  def to_s
    model.class.name.demodulize.downcase
  end

end
