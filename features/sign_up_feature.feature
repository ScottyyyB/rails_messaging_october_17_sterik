Feature: Accessing the Sign Up page from the landing page
  As an unregistered user
  In order to access the Craft Academy Mailboxer
  I should be able to sign up

  Scenario: Access Sign Up page
    Given I am on the landing page
    When I press the "Sign up" button
    Then I should be redirected to the "/users/sign_up" page

  Scenario: Visitor on users page
    Given I am on the "users/sign_up" page
    Then I should see "CA Mailboxer"
    And I should see "Login"
    And I should see "Sign up"

  Scenario: Visitor fills in all fields [Happy Path]
    Given I am on the "users/sign_up" page
    When I fill in "Name" with "Oliver"
    And I fill in "Email" with "rickroll@hotmail.com"
    And I fill in "Password" with "hello123"
    And I fill in "Password confirmation" with "hello123"
    And I click button "Create"
    Then I should be on the "conversations/new" page
    And I should see "Welcome! You have signed up successfully."
    And I should see "Hello, Oliver"
