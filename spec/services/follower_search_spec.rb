require 'rails_helper'

describe FollowerSearch do
  subject { FollowerSearch.new("agpiermarini", ENV["github_token"]) }
  context 'initialize' do
    it 'initializes with attributes' do
      expect(subject).to be_a FollowerSearch
    end
  end
end
