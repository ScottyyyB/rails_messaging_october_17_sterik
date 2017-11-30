Feature: Accessing the Sign Up page from the landing page
  As an unregistered user
  In order to access the Craft Academy Mailboxer
  I should be able to sign up

 Scenario: Access Sign Up page
    Given I am on the landing page
    When I press the "Sign up" button
    Then I should be redirected to the "/users/sign_up" page

  Background:
    Given I am on the "users/sign_up" page

  Scenario: Visitor on users page
    Then I should see "CA Mailboxer"
    And I should see "Login"
    And I should see "Sign up"
