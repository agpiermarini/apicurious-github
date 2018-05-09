require 'rails_helper'

describe 'User' do
  describe 'with github authentication' do
    context 'visits their own profile page' do
      it 'and sees their profile information' do
        api_user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(api_user)

        response = Faraday.get "https://api.github.com/users/#{api_user.username}"
        github_user = JSON.parse(response.body, symbolize_names: true)

        visit '/agpiermarini'

        expect(page.status_code).to eq(200)
        expect(page).to have_content(github_user[:login])
        expect(page).to have_content(github_user[:name])
      end
    end

    context 'visits another users profile page' do
      it 'and sees that users profile information' do
        api_user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(api_user)

        github_username = "jmejia"

        response = Faraday.get "https://api.github.com/users/#{github_username}"
        github_user = JSON.parse(response.body, symbolize_names: true)

        visit "/#{github_username}"

        expect(page.status_code).to eq(200)
        expect(page).to have_content(github_user[:login])
        expect(page).to have_content(github_user[:name])
      end
    end

    context 'visits an invalid account page' do
      it 'and sees 404 message' do
        api_user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(api_user)

        github_username = "asdfasdfadsgadf"

        response = Faraday.get "https://api.github.com/users/#{github_username}"
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        visit "/#{github_username}"

        expect(page.status_code).to eq(404)
        expect(page).to have_content(parsed_response[:message])
      end
    end
  end
end
