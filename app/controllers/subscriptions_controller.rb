class SubscriptionsController < ApplicationController
  def update
    options =
      if params[:condition] == 'watch'
        { subscribed: true, ignored: false }
      else
        { subscribed: false, ignored: true }
      end

    Rails.logger.info("#{params[:condition]} #{repo}")
    client.update_subscription(repo, options)

    render status: 201, json: { 'status' => 'ok' }.to_json
  end

  def destroy
    Rails.logger.info("unwatch #{repo}")
    client.delete_subscription(repo)
    render status: 200, json: { 'status' => 'ok' }.to_json
  end

  private

  def client
    @client ||= Octokit::Client.new(login: ENV['GITHUB_USER'], access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end

  def repo
    "#{params[:owner]}/#{params[:repo]}"
  end
end
