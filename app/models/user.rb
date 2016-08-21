class User < ApplicationRecord
  def self.find_or_create_with_omniauth_by!(auth)
    user = find_by(uid: auth.uid)

    if user
      user.oauth_token = auth.credentials.token
      user.save!
      user
    else
      create! do |u|
        u.uid = auth.uid
        u.nickname = auth.info.nickname
        u.oauth_token = auth.credentials.token
      end
    end
  end
end
