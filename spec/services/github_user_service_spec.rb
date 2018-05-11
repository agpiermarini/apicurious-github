require 'rails_helper'

describe GithubUserService do
  subject { GithubUserService.new("agpiermarini", ENV["github_token"]) }
  context 'initialize' do
    it 'exists when passed a valid state' do
      expect(subject).to be_a GithubUserService
    end
  end

  context 'instance methods' do
    context '#user' do
      it 'can return valid user information' do
        VCR.use_cassette("github-user-service-valid") do
          expect(subject.user).to be_a Hash
          expect(subject.user).to have_key :name
          expect(subject.user).to have_key :login
          expect(subject.user).to have_key :bio
        end
      end
    end
  end

  context 'invalid user endpoint' do
    it 'is informed when user invalid' do
      VCR.use_cassette("github-user-service-invalid") do
        invalid_subject = GithubUserService.new("alsdjfaklsdfasdfgd", ENV["github_token"])
        expect(invalid_subject.user).to be_a Hash
        expect(invalid_subject.user).to have_key :message
      end
    end
  end
end
