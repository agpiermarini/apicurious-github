FactoryBot.define do
  factory :user do
    username 'agpiermarini'
    oauth_token ENV["github_token"]
    avatar_url "https://avatars1.githubusercontent.com/u/19535775?v=4"
  end
end
