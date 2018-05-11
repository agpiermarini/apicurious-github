require 'rails_helper'

describe GithubStarredService do
  subject { GithubStarredService.new("iandouglas", ENV["github_token"]) }
  context 'initialize' do
    it 'initializes with attributes' do
      expect(subject).to be_a GithubStarredService
    end
  end
end
