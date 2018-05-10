require 'rails_helper'

describe 'User' do
  describe 'with github authentication' do
    context 'visits starred page' do
      it 'and sees a list of starred repos' do
        VCR.use_cassette("github-starred-endpoint-self") do
          user = create(:user, username: "iandouglas")
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          visit "/#{user.username}/starred"

          expect(page.status_code).to eq(200)
          expect(page).to have_css(".a1")

          within(".a1") do
            expect(page).to have_css(".repo-name")
            expect(page).to have_css(".repo-updated")
            expect(page).to have_content("Last updated")
          end
        end
      end
    end
  end
end
