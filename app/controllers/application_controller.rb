class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :client

  private

  def logged_in?
    !!session[:user_id]
  end

  def client
    @client ||= current_user &&
                Octokit::Client.new(access_token: current_user.oauth_token)
  end

  def current_user
    return nil unless session[:user_id]
    User.find(session[:user_id])
  end
end
