Feature: adminPage
 
  
  As an admin
  I shouldn't have access to the admin page if I haven't authenticated
  so that people don't touch things their not supposed to
  
  Scenario: As an admin I shouldnt have access to the admin page without logging in
    Given I am on an index screen
    Then I click on the "Admin Portal" button
    Then I should be on an index screen
    Then I should see a "Admin Portal" button
  