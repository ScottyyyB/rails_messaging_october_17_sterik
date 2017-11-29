Feature: Accessing the Sign up form from the Sign up page
  As a visitor
  In order to sign up
  I should be able to fill in the sign up form

  Background:
    Given I am on the "users/sign_up" page


  Scenario: Visitor on users page
    Then I should see "CA Mailboxer"
    And I should see "Login"
    And I should see "Sign up"
