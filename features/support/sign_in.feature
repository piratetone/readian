Feature: Sign in

  Scenario: A visitor signs in
    Given that I have an account
      And that I am on the homepage
      And I click "Sign In"
    When I fill in the form with my login details
    Then I should be signed in

  Scenario: A visitor signs up
    Given that I am on the homepage
      And I click "Sign Up"
    When I fill in the form with my sign up details
      And I click "Sign up"
    Then there should be 1 users in the database
      And be redirected to the homepage