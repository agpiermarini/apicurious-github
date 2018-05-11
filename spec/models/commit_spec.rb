require 'rails_helper'

describe Commit do
  subject { Commit.new({})}
  context 'initialize' do
    it 'initializes with hash of attributes' do
      expect(subject).to be_a Commit
    end
  end
end
