require 'rails_helper'

describe 'User' do
  describe 'with github authentication' do
    context 'visits their own following page' do
      it 'and sees a list of followers' do
        VCR.use_cassette("github-following-endpoint-self") do
          user = create(:user)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          github_user = "nergdnvlt"

          visit "/#{github_user}/following"

          expect(page.status_code).to eq(200)
          expect(page).to have_css(".a1")

          within(".a1") do
            expect(page).to have_css(".follow-name")
            expect(page).to have_css(".follow-avatar")
          end
        end
      end
    end
  end
end
