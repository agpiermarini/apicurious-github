require 'rails_helper'

describe 'User' do
  describe 'with github authentication' do
    context 'visits their own profile page' do
      it 'and sees their profile information' do
        VCR.use_cassette("github-user-endpoint-self") do
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

      it 'and sees a list of their commits' do
        VCR.use_cassette("github-user-commits-self") do
          user = create(:user)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          visit '/agpiermarini'

          expect(page).to have_css(".push-event")
          expect(page).to have_css(".event-commits")
        end
      end
    end

    context 'visits another users profile page' do
      it 'and sees that users profile information' do
        VCR.use_cassette("github-user-endpoint-other") do
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
    end

    context 'visits an invalid account page' do
      it 'and sees 404 message' do
        VCR.use_cassette("github-user-endpoint-no-user") do
          api_user = create(:user)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(api_user)

          github_username = "asdfasdfadsgadf"

          conn = Faraday.new "https://api.github.com/users/#{github_username}"

          response = conn.get do |req|
            req.headers["Authorization"] = "token #{ENV["github_token"]}"
          end

          parsed_response = JSON.parse(response.body, symbolize_names: true)

          visit "/#{github_username}"

          expect(page.status_code).to eq(404)
          expect(page).to have_content(parsed_response[:message])
        end
      end
    end
  end
end
