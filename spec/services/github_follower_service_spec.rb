require 'rails_helper'

describe GithubFollowerService do
  subject { GithubFollowerService.new("agpiermarini", ENV["github_token"]) }
  context 'initialize' do
    it 'exists when passed a valid state' do
      expect(subject).to be_a  GithubFollowerService
    end
  end

  context 'instance methods' do
    context '#user' do
      it 'can return valid user information' do
        VCR.use_cassette("github-follower-service-valid") do
          expect(subject.followers).to be_a  Array
          expect(subject.followers.first).to be_a Hash
          expect(subject.followers.first).to have_key :login
          expect(subject.followers.first).to have_key :html_url
        end
      end

      # How to have a different subject with invalid username
      skip 'is informed when user invalid' do
        VCR.use_cassette("github-followers-service-invalid") do
          expect(subject.followers).to be_a Hash
          expect(subject.followers).to have_key :message
        end
      end
    end
  end
end
