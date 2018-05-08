require 'rails_helper'

describe 'Github OAuth' do
  it 'user can log in with github credentials'  do
    visit '/'

    expect(page).to_not have_content('Sign out')

    click_on 'Sign in'

    expect(page.status_code).to eq(200)

    expect(page).to_not have_content('Sign in')

    click_on 'Sign out'

    expect(page.status_code).to eq(200)
  end
end
