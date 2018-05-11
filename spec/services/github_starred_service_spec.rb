require 'rails_helper'

describe GithubStarredService do
  subject { GithubStarredService.new("iandouglas", ENV["github_token"]) }
  context 'initialize' do
    it 'initializes with attributes' do
      expect(subject).to be_a GithubStarredService
    end
  end

  context 'instance methods' do
    context '#starred_repo_info' do
      it 'can return starred repo information for valid user' do
        VCR.use_cassette("github-starred-service-valid") do
          expect(subject.starred_repo_info).to be_a  Array
          expect(subject.starred_repo_info.first).to be_a Hash
          expect(subject.starred_repo_info.first).to have_key :name
          expect(subject.starred_repo_info.first).to have_key :description
          expect(subject.starred_repo_info.first).to have_key :html_url
        end
      end
    end
  end

  context 'invalid user endpoint' do
    it 'is informed when user invalid' do
      VCR.use_cassette("github-starred-service-invalid") do
        invalid_subject = GithubStarredService.new("asdfklajsdfnasd", ENV["github_token"])
        expect(invalid_subject.starred_repo_info).to be_a Hash
        expect(invalid_subject.starred_repo_info).to have_key :message
      end
    end
  end
end
