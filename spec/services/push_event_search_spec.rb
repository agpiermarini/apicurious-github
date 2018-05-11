require 'rails_helper'

describe PushEventSearch do
  subject { PushEventSearch.new("agpiermarini", ENV["github_token"]) }
  context 'initialize' do
    it 'exists with attributes' do
      expect(subject).to be_a PushEventSearch
    end
  end

  context 'instance methods' do
    it '#profile' do
      VCR.use_cassette('push-event-search') do
        expect(subject.push_events).to be_an Array
        expect(subject.push_events.first).to be_a PushEvent
      end
    end
  end
end
