# frozen_string_literal: true

RSpec.describe User, type: :model do
  describe '.find_or_create_with_omniauth_by!' do
    context 'given a user' do
      let(:auth_taro) { build(:omni_auth_auth_hash_taro) }

      before { create(:user_taro) }

      it 'is same uid' do
        expect(
          User.find_or_create_with_omniauth_by!(auth_taro).uid
        ).to eq auth_taro.uid
      end

      it 'updates an oauth_token' do
        expect(
          User.find_or_create_with_omniauth_by!(auth_taro).oauth_token
        ).to eq auth_taro.credentials.token
      end
    end

    context 'given nothing' do
      let(:auth_hanako) { build(:omni_auth_auth_hash_hanako) }

      it 'creates a user' do
        expect(
          User.find_or_create_with_omniauth_by!(auth_hanako).uid
        ).to eq auth_hanako.uid
      end
    end
  end
end
