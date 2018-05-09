require 'rails_helper'

describe 'Github OAuth' do
  it 'user can log in with github credentials'  do
    VCR.use_cassette("github-oauth-login") do
      visit '/'

      expect(page).to_not have_content('Sign out')

      click_on 'Sign in'

      expect(page.status_code).to eq(200)

      expect(page).to_not have_content('Sign in')

      expect(current_path).to eq("/#{stub_auth.extra.raw_info.login}")

      click_on 'Sign out'

      expect(current_path).to eq(root_path)

      expect(page.status_code).to eq(200)
    end
  end
end
