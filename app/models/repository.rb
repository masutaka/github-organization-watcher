class Repository
  class << self
    def find_by_organization_name(organization_name)
      client.organization_repositories(organization_name)
    end

    private

    def client
      @client ||= Octokit::Client.new(login: ENV['GITHUB_USER'], access_token: ENV['GITHUB_ACCESS_TOKEN'])
    end
  end
end
