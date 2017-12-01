Feature: Landing page
  As a visitor
  In order to find out more about Craft Academy Mailboxer
  I should see the landing page

Scenario: Display on the landing page
  When I visit the landing page
  Then I should see a title "Craft Academy Mailboxer"
  And I should see a link "CA Mailboxer"
  And I should see a link "Login"
  And I should see a link "Sign up"
  
