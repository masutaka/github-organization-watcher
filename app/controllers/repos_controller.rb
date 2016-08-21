class ReposController < ApplicationController
  def index
    @org_name = params[:org_name]
    @subscriptions = Repo.subscriptions_by_org(@org_name, client)
  end
end
