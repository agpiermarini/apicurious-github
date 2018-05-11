require 'rails_helper'

describe GithubFollowingService do
  subject { GithubFollowingService.new("plato721", ENV["github_token"]) }
  context 'initialize' do
    it 'exists when passed a valid state' do
      expect(subject).to be_a  GithubFollowingService
    end
  end

  context 'instance methods' do
    context '#user' do
      it 'can return valid user information' do
        VCR.use_cassette("github-following-service-valid") do
          expect(subject.following).to be_a  Array
          expect(subject.following.first).to be_a Hash
          expect(subject.following.first).to have_key :login
          expect(subject.following.first).to have_key :html_url
        end
      end
    end
  end

  context 'invalid user endpoint' do
    it 'is informed when user invalid' do
      VCR.use_cassette("github-following-service-invalid") do
        invalid_subject = GithubFollowingService.new("asdfklajsdfnasd", ENV["github_token"])
        expect(invalid_subject.following).to be_a Hash
        expect(invalid_subject.following).to have_key :message
      end
    end
  end
end
