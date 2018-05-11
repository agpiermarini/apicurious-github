require 'rails_helper'

describe StarredSearch do
  subject { StarredSearch.new("iandouglas", ENV["github_token"]) }
  context 'initialize' do
    it 'initializes with attributes' do
      expect(subject).to be_a StarredSearch
    end
  end

  context '#repos' do
    it 'returns array of starred repos' do
      VCR.use_cassette("starred-search") do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        expect(subject.repos).to be_an Array
        expect(subject.repos.first).to be_a Repository
      end
    end
  end
end
