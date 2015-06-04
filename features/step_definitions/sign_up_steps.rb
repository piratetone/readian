Given(/^that I have an account$/) do
  steps %Q{
    Given that I am on the homepage
    And I click "Sign Up"
    When I fill in the form with my sign up details
    And I click "Sign up"
    Then there should be 1 users in the database
    And be redirected to the homepage
  }
end

When(/^I fill in the form with my sign up details$/) do
  page.fill_in "Email", with: "test@test.com"
  page.fill_in "user[password]", with: "12345678"
  page.fill_in "Password confirmation", with: "12345678"
end

Then(/^there should be (\d+) users in the database$/) do |number|
  expect(User.count).to be number.to_i
end

Then(/^be redirected to the homepage$/) do
  expect(page.has_content?("Top Stories")).to be true
end