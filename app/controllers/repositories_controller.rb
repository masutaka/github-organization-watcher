class RepositoriesController < ApplicationController
  def index
    @organization_name = params[:organization_name]
    @repositories = Organization.repositories(@organization_name)
  end
end
