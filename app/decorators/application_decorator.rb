class ApplicationDecorator < Draper::Decorator
  delegate :to_s, to: :source

  include Draper::LazyHelpers
end
