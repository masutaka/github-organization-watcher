# frozen_string_literal: true

class SessionsController < ApplicationController
  def callback
    auth = request.env['omniauth.auth']
    user = User.find_or_create_with_omniauth_by!(auth)
    session[:user_id] = user.id
    redirect_to orgs_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
