require 'rails_helper'

describe Profile do
  subject { Profile.new({}) }
  context 'initialize' do
    it 'initializes with hash' do
      expect(subject).to be_a Profile
    end
  end
end
