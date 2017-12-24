# frozen_string_literal: true

FactoryBot.define do
  factory :omni_auth_auth_hash, class: OmniAuth::AuthHash do
    factory :omni_auth_auth_hash_taro do
      initialize_with do
        OmniAuth::AuthHash.new(
          uid: '123456',
          info: OmniAuth::AuthHash::InfoHash.new(nickname: 'taro'),
          credentials: OmniAuth::AuthHash.new(token: 'e9c8c42eb783cc2304698c289dfcbe86c5b3e5d5')
        )
      end
    end

    factory :omni_auth_auth_hash_hanako do
      initialize_with do
        OmniAuth::AuthHash.new(
          uid: '789012',
          info: OmniAuth::AuthHash::InfoHash.new(nickname: 'hanako'),
          credentials: OmniAuth::AuthHash.new(token: 'c8c8c42eb783cc2304698c289dfcbe86c5b3e5d5')
        )
      end
    end
  end
end
