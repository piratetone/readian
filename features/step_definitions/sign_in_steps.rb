Given(/^that I am on the homepage$/) do
  visit "/"
end

Given(/^I click "(.*?)"$/) do |target|
  click_on target
end

When(/^I fill in the form with my login details$/) do
  page.fill_in "Email", with: "test@test.com"
  page.fill_in "Password", with: "12345678"
end

Then(/^I should be signed in$/) do
  expect(page.has_content?("Signed in successfully.")).to be true
end
