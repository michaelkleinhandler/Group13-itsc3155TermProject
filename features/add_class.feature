Feature: Login
  
  As a user
  So that I can access the tools of the website
  I want to login to the website
  
  Scenario: As a user I want to be able to login to the website
    Given I am on the login screen
    When I fill out the username and password
    Then I click on the "commit" button
    And I should see the "My Classes" button
  