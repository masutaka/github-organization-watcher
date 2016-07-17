class RepositoriesController < ApplicationController
  def index
    @organization_name = params[:organization_name]
    @repositories = Repository.find_by_organization_name(@organization_name)
  end
end
