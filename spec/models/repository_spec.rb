require 'rails_helper'

describe Repository do
  subject { Repository.new({})}
  context 'initialize' do
    it 'initializes when passed a hash' do
      expect(subject).to be_a Repository
    end
  end
end
