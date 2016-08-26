# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :client, :current_user

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

  def authenticate_user!
    return if logged_in?
    redirect_to root_path, alert: 'Please Login'
  end

  def authenticate_user_xhr!
    return if logged_in?
    render status: 401, json: { 'status' => 'failed' }.to_json
  end
end
