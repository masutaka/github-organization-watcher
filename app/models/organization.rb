class Organization
  class << self
    def all
      client.organizations
    end

    def repositories(name)
      client.organization_repositories(name)
    end

    private

    def client
      @@client ||= Octokit::Client.new(login: ENV['GITHUB_USER'], access_token: ENV['GITHUB_ACCESS_TOKEN'])
    end
  end
end
