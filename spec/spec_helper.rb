
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups


end

def create_valid_user
  visit new_user_path
  fill_in 'username', :with => "testing_username"
  fill_in 'password', :with => "password"
  click_on "Create User"
end

def log_in_valid_user
  user = User.create(username: "testing_username",
                      password: "password")
  visit new_session_path
  fill_in 'username', :with => "testing_username"
  fill_in 'password', :with => "password"
  click_on "Log In"
end

def create_valid_user_comment(user)
  user2 = create :user
  UserComment.create(author_id: user.id,
                     user_id: user2.id,
                     body: "testing user comment")
  visit user_url(user2)
end
