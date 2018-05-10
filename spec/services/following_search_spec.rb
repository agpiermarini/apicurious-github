require 'rails_helper'

describe FollowingSearch do
  subject { FollowingSearch.new("plato721", ENV["github_token"]) }
  context 'initialize' do
    it 'initializes with attributes' do
      expect(subject).to be_a FollowingSearch
    end
  end

  context 'instance methods' do
    it '#following' do
      VCR.use_cassette("following-search") do
        expect(subject.following).to be_an Array
        expect(subject.following.first).to be_a Profile
      end
    end
  end
end
