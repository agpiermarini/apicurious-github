require 'rails_helper'

describe RepoSearch do
  subject { RepoSearch.new("agpiermarini", ENV["github_token"]) }
  context 'initialize' do
    it 'exists with attributes' do
      expect(subject).to be_a RepoSearch
    end
  end

  context 'instance methods' do
    it '#profile' do
      VCR.use_cassette('repo-search') do
        expect(subject.repos).to be_an Array
        expect(subject.repos.first).to be_a Repository
      end
    end
  end
end
