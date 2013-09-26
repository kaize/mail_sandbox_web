module ServiceLocator
  module Services
    def self.facebook
      @facebook ||= FacebookService.new
    end

    def self.github
      @github ||= GithubService.new
    end

    def self.email_sender
      @email_sender ||= ::Services::EmailService.new
    end
  end

  def self.services
    Services
  end
end
