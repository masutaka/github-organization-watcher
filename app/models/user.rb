# frozen_string_literal: true

class User < ApplicationRecord
  class << self
    def find_or_create_with_omniauth_by!(auth)
      user = find_by(uid: auth.uid)

      if user
        find_with_omniauth_by(auth, user)
      else
        create_with_omniauth_by!(auth)
      end
    end

    private

    def find_with_omniauth_by(auth, user)
      user.update!(oauth_token: auth.credentials.token)
      user
    end

    def create_with_omniauth_by!(auth)
      create! do |u|
        u.uid = auth.uid
        u.nickname = auth.info.nickname
        u.oauth_token = auth.credentials.token
      end
    end
  end
end
