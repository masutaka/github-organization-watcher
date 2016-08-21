class User < ApplicationRecord
  def self.find_or_create_with_omniauth_by!(auth)
    find_or_create_by!(uid: auth['uid']) do |u|
      u.uid = auth['uid']
      u.nickname = auth['info']['nickname']
      u.oauth_token = auth['credentials']['token']
    end
  end
end
