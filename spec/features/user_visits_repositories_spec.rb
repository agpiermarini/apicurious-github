require 'rails_helper'

describe 'User' do
  describe 'with github authentication' do
    context 'visits their own repository page' do
      skip 'and sees a list of repositories' do
        VCR.use_cassette("github-repo-endpoint-self") do
          user = create(:user)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          visit "/#{user.username}/repos"

          expect(page.status_code).to eq(200)
          expect(page).to have_css(".repository")

          within(".repository:nth-of-type(1)") do
            expect(page).to have_content("Repository Name")
          end
        end
      end
    end
  end
end
