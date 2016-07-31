class RepositoriesController < ApplicationController
  def index
    @org_name = params[:org_name]
    @subscriptions = Repository.subscriptions_by_org(@org_name)
  end
end
