class Repository
  class << self
    def subscriptions_by_organization(name)
      agent = Sawyer::Agent.new('https://example.com')

      repositories(name).map do |r|
        Sawyer::Resource.new(agent, repo: r.name, condition: condition(r.full_name))
      end
    end

    private

    def repositories(organization_name)
      client.organization_repositories(organization_name)
    end

    def condition(full_name)
      subscription = client.subscription(full_name)

      case
      when subscription.subscribed
        :watching
      when subscription.ignored
        :ignoring
      end

    rescue Octokit::NotFound
      :unwatching
    end

    def client
      @@client ||= Octokit::Client.new(login: ENV['GITHUB_USER'], access_token: ENV['GITHUB_ACCESS_TOKEN'])
    end
  end
end
