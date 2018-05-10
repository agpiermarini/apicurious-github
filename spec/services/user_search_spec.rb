require 'rails_helper'

describe UserSearch do
  subject { UserSearch.new("agpiermarini", nil) }
  context 'initialize' do
    it 'exists with attributes' do
      expect(subject).to be_a UserSearch
    end
  end

  context 'instance methods' do
    it '#profile' do
      VCR.use_cassette('user-search') do
        expect(subject.profile).to be_a Profile
      end
    end
  end
end
