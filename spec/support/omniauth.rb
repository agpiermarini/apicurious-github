def stub_auth
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
  {
    "provider"=>"github",
    "uid"=>"19535775",
    "info"=>{"nickname"=>"agpiermarini", "email"=>nil, "name"=>"Andrew", "image"=>"https://avatars1.githubusercontent.com/u/19535775?v=4", "urls"=>{"GitHub"=>"https://github.com/agpiermarini", "Blog"=>""}},
    "credentials"=>{"token"=>"1943d6e2d64702023be892c02e3adfb27b026f0c", "expires"=>false},
    "extra"=>
      {"raw_info"=>
        {"login"=>"agpiermarini",
         "id"=>19535775,
         "avatar_url"=>"https://avatars1.githubusercontent.com/u/19535775?v=4",
         "gravatar_id"=>"",
         "url"=>"https://api.github.com/users/agpiermarini",
         "html_url"=>"https://github.com/agpiermarini",
         "followers_url"=>"https://api.github.com/users/agpiermarini/followers",
         "following_url"=>"https://api.github.com/users/agpiermarini/following{/other_user}",
         "gists_url"=>"https://api.github.com/users/agpiermarini/gists{/gist_id}",
         "starred_url"=>"https://api.github.com/users/agpiermarini/starred{/owner}{/repo}",
         "subscriptions_url"=>"https://api.github.com/users/agpiermarini/subscriptions",
         "organizations_url"=>"https://api.github.com/users/agpiermarini/orgs",
         "repos_url"=>"https://api.github.com/users/agpiermarini/repos",
         "events_url"=>"https://api.github.com/users/agpiermarini/events{/privacy}",
         "received_events_url"=>"https://api.github.com/users/agpiermarini/received_events",
         "type"=>"User",
         "site_admin"=>false,
         "name"=>"Andrew",
         "company"=>nil,
         "blog"=>"",
         "location"=>nil,
         "email"=>nil,
         "hireable"=>nil,
         "bio"=>nil,
         "public_repos"=>37,
         "public_gists"=>3,
         "followers"=>2,
         "following"=>0,
         "created_at"=>"2016-05-23T15:58:32Z",
         "updated_at"=>"2018-05-04T04:05:03Z"},
       "all_emails"=>[]}}
  )
end
