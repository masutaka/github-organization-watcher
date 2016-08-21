RSpec.describe User, type: :model do
  describe '.find_or_create_with_omniauth_by!' do
    context 'given a user' do
      let(:user_taro) { FactoryGirl.create(:user_taro) }
      let(:auth_taro) { FactoryGirl.build(:omni_auth_auth_hash_taro) }

      it 'is the user' do
        expect(
          User.find_or_create_with_omniauth_by!(auth_taro).uid
        ).to eq user_taro.uid
      end
    end

    context 'given nothing' do
      let(:auth_hanako) { FactoryGirl.build(:omni_auth_auth_hash_hanako) }

      it 'creates a user' do
        expect(
          User.find_or_create_with_omniauth_by!(auth_hanako).uid
        ).to eq auth_hanako.uid
      end
    end
  end
end
