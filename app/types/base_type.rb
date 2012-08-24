module BaseType
  extend ActiveSupport::Concern

  module ClassMethods
    def model_name
      superclass.model_name
    end

    def sti_name
      superclass.name
    end
  end
end
