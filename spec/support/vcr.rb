VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/cassettes"
  config.filter_sensitive_data('<GITHUB OAUTH TOKEN>') { ENV["github_token"] }
  config.hook_into :webmock
end
