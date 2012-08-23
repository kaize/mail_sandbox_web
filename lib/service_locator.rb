module ServiceLocator
  module Services
    def self.facebook
      @facebook ||= FacebookService.new
    end

    def self.github
      @github ||= GithubService.new
    end

  end

  def self.services
    Services
  end
end
