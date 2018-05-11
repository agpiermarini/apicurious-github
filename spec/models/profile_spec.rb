require 'rails_helper'

describe Profile do
  subject { Profile.new({login: "agpiermarini"}) }
  context 'initialize' do
    it 'initializes with hash' do
      expect(subject).to be_a Profile
    end
  end

  describe 'instance methods' do
    context '#starred_count' do
      it 'returns integer corresponding to the number of starred repos' do
        VCR.use_cassette("profile-starred_count") do
          user = create(:user)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          expect(subject.starred_count(user.username, user.oauth_token)).to be(0)
        end
      end
    end
  end
end
