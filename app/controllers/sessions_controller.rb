class SessionsController < ApplicationController
  def callback
    redirect_to root_path
  end
end
