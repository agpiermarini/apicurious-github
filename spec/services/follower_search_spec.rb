require 'rails_helper'

describe FollowerSearch do
  subject { FollowerSearch.new("agpiermarini", ENV["github_token"]) }
  context 'initialize' do
    it 'initializes with attributes' do
      expect(subject).to be_a FollowerSearch
    end
  end

  context 'instance methods' do
    it '#followers' do
      VCR.use_cassette("follower-search") do
        expect(subject.followers).to be_an Array
        expect(subject.followers.first).to be_a Profile
      end
    end
  end
end
