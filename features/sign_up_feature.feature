Feature: Accessing the Sign Up page from the landing page
  As an unregistered user
  In order to access the Craft Academy Mailboxer
  I should be able to sign up

  Background:
    Given the following user exists
      | name   | email                | password   | password_confirmation |
      | Arnold | hotmale@hotmail.com  | whatever   | whatever              |


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
      Then I should see "Welcome! You have signed up successfully."
      And I should be on the "conversations/new" page
      And I should see "Hello, Oliver"


    Scenario: Visitor fills in all fields except Name [Sad Path]
      Given I am on the "users/sign_up" page
      When I fill in "Email" with "rickroll@hotmail.com"
      And I fill in "Password" with "hello123"
      And I fill in "Password confirmation" with "hello123"
      And I click button "Create"
      Then I should see "1 error prohibited this user from being saved:"
      And I should see "Name can't be blank"

    Scenario: Visitor fills in all fields except Email [Sad Path]
      Given I am on the "users/sign_up" page
      When I fill in "Name" with "Oliver"
      And I fill in "Password" with "hello123"
      And I fill in "Password confirmation" with "hello123"
      And I click button "Create"
      Then I should see "1 error prohibited this user from being saved:"
      And I should see "Email can't be blank"

    Scenario: Visitor fills in all fields except Password [Sad Path]
      Given I am on the "users/sign_up" page
      When I fill in "Name" with "Oliver"
      And I fill in "Email" with "rickroll@hotmail.com"
      And I fill in "Password confirmation" with "hello123"
      And I click button "Create"
      Then I should see "2 errors prohibited this user from being saved:"
      And I should see "Password can't be blank"
      And I should see "Password confirmation doesn't match Password"

    Scenario: Visitor fills in all fields, Password and Password confirmation less than 8 characters [Sad Path]
      Given I am on the "users/sign_up" page
      When I fill in "Name" with "Oliver"
      And I fill in "Email" with "rickroll@hotmail.com"
      And I fill in "Password" with "hello12"
      And I fill in "Password confirmation" with "hello12"
      And I click button "Create"
      Then I should see "1 error prohibited this user from being saved:"
      And I should see "Password is too short (minimum is 8 characters)"

    Scenario: Visitor fills in all fields with Name more than 10 characters [Sad Path]
      Given I am on the "users/sign_up" page
      When I fill in "Name" with "Oliverrrrrrrr"
      And I fill in "Email" with "rickroll@hotmail.com"
      And I fill in "Password" with "hello123"
      And I fill in "Password confirmation" with "hello123"
      And I click button "Create"
      Then I should see "1 error prohibited this user from being saved:"
      And I should see "Name is too long (maximum is 10 characters)"


    Scenario: Visitor fills in all fields, Password and Password confirmation less than 8 characters [Sad Path]
      Given I am on the "users/sign_up" page
      When I fill in "Name" with "Oliver"
      And I fill in "Email" with "hotmale@hotmail.com"
      And I fill in "Password" with "hello123"
      And I fill in "Password confirmation" with "hello123"
      And I click button "Create"
      Then I should see "1 error prohibited this user from being saved:"
      Then I should see "Email has already been taken"

    Scenario: Visitor fills in all fields, Password and Password confirmation less than 8 characters [Sad Path]
      Given I am on the "users/sign_up" page
      When I fill in "Name" with "Arnold"
      And I fill in "Email" with "rickroll@hotmail.com"
      And I fill in "Password" with "hello123"
      And I fill in "Password confirmation" with "hello123"
      And I click button "Create"
      Then I should see "1 error prohibited this user from being saved:"
      Then I should see "Name has already been taken"

    Scenario: Visitor is already signed in and tries to sign in again [Sad Path]
      Given I am on the "users/sign_up" page
      Given I am signed in
