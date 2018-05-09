require 'rails_helper'

describe GithubUserService do
  subject { GithubUserService.new("agpiermarini") }
  context 'initialize' do
    it 'exists when passed a valid state' do
      expect(subject).to be_a  GithubUserService
    end
  end
end
