Feature: Login
  
  As a visitor
  So that I can access the website
  I want to go to a page to create my account
  
  Scenario: As a user I want to be able to login to the website
    Given I am on the login screen
    When I click on the "Sign Up" button
#    Then I click on the "commit" button
    Then I should see the "Sign Up" buttons
  