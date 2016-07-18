class Organization
  class << self
    def all
      client.organizations
    end

    def repositories(name)
      client.organization_repositories(name)
    end

    def repositories_subscription(name)
      repositories(name).map do |r|
        [r.name, subscription(r.full_name)]
      end.to_h
    end

    private

    def subscription(full_name)
      client.subscription(full_name)
    rescue Octokit::NotFound
      nil
    end

    def client
      @@client ||= Octokit::Client.new(login: ENV['GITHUB_USER'], access_token: ENV['GITHUB_ACCESS_TOKEN'])
    end
  end
end
