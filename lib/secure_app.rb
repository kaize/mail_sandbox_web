module SecureApp
  class << self

    def generate_string(n = nil)
      SecureRandom.hex(n)
    end

    def generate_token
      self.generate_string(32)
    end

  end
end
