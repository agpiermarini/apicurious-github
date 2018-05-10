require 'rails_helper'

describe StarredSearch do
  subject { StarredSearch.new("iandouglas", ENV["github_token"]) }
  context 'initialize' do
    it 'initializes with attributes' do
      expect(subject).to be_a StarredSearch
    end
  end
end
