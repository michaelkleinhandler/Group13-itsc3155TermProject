Feature: Not signed in
  
  As a user
  I should have to sign in 
  so people can log in
  
  Scenario: As a user I shouldnt have access to things when not logged in
    Given I am on the index screen
    Then I click on the "Admin Portal" button
    Then I should be on the index screen
    Then I should see the "Admin Portal" button

