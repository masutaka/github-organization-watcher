class OrgsController < ApplicationController
  before_action :authenticate_user!, only: [ :index ]

  def index
    @orgs = client.organizations
  end
end
