class RepositoriesController < ApplicationController
  def index
    @organization_name = params[:organization_name]
  end
end
