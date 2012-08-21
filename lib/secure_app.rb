module SecureApp
  class << self

    def generate_string(n = nil)
      SecureRandom.hex(n)
    end

  end
end
