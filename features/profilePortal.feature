Feature: signUp
 
  
  As a user
  I should be able to sign up
  
  Scenario: As an user I should be able to sign up
    Given I am on an index screen of the application
    Then I click on the "Sign Up" button to sign up
    Then I should be on the sign up screen
  