Given(/^that I have an account$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in the form with my sign up details$/) do
  fill_in "Email", with: "test@test.com"
  fill_in "Password", with: "12345678"
  fill_in "Password confirmation", with: "12345678"
end

Then(/^I should have an account$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^be redirected to the homepage$/) do
  pending # express the regexp above with the code you wish you had
end
