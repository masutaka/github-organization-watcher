class ReposController < ApplicationController
  before_action :authenticate_user!, only: [ :index ]

  def index
    @org_name = params[:org_name]
    @orgs = client.organizations
    @subscriptions = Repo.subscriptions_by_org(@org_name, client)
  end
end
