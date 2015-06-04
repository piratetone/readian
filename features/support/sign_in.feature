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
    When I fill in the form with my login details
    Then I should have an account
      And be redirected to the homepage