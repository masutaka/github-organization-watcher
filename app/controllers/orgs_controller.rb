class OrgsController < ApplicationController
  def index
    @orgs = client.organizations
  end
end
