class SubscriptionsController < ApplicationController
  before_action :authenticate_user_xhr!, only: [ :update, :destroy ]

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

  def repo
    "#{params[:owner]}/#{params[:repo]}"
  end
end
