class RepositoriesController < ApplicationController
  def index
    @organization_name = params[:organization_name]
    @subscriptions = Repository.subscriptions_by_organization(@organization_name)
  end
end
