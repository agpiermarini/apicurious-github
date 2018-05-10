require 'rails_helper'

describe GithubRepoService do
  subject { GithubRepoService.new("agpiermarini", ENV["github_token"]) }
  context 'initialize' do
    it 'exists when passed a valid state' do
      expect(subject).to be_a  GithubRepoService
    end
  end

  context 'instance methods' do
    context '#user' do
      it 'can return valid user information' do
        VCR.use_cassette("github-repo-service-valid") do
          expect(subject.repos).to be_a  Array
          expect(subject.repos.first).to be_a Hash
          expect(subject.repos.first).to have_key :name
          expect(subject.repos.first).to have_key :description
          expect(subject.repos.first).to have_key :html_url
        end
      end

      # How to have a different subject with invalid username
      skip 'can return valid user information' do
        VCR.use_cassette("github-repo-service-invalid") do
          expect(subject.repos).to be_a  Array
          expect(subject.user).to have_key :message
        end
      end
    end
  end
end
