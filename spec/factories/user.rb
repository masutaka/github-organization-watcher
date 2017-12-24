# frozen_string_literal: true

FactoryBot.define do
  factory :user_taro, class: User do
    uid '123456'
    nickname 'taro'
    oauth_token 'd5c8c42eb783cc2304698c289dfcbe86c5b3e5d5'
  end
end
