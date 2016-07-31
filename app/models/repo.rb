class Repo
  class << self
    THREAD_NUM = 10

    def subscriptions_by_org(name)
      agent = Sawyer::Agent.new(Settings.endpoint)
      results = []
      mutex = Mutex::new

      Parallel.each(repos(name), in_threads: THREAD_NUM) do |r|
        condition = condition(r.full_name)

        mutex.synchronize do
          results << Sawyer::Resource.new(agent, repo: r.name, condition: condition)
        end
      end

      results.sort { |a, b| a.repo <=> b.repo }
    end

    private

    def repos(org_name)
      client.organization_repositories(org_name)
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