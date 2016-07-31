class SubscriptionsController < ApplicationController
  def update
    render status: 201, json: { 'status' => 'ok' }.to_json
  end
end
