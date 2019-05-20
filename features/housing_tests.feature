Feature:
    As a student
    I want to see a house's details
    So that I can decide if I like the house
    As a student
    I want to see houses available to rent
    So that I can select a house that I like
    As a student
    I want to sort houses
    So that I can organize them based on my preferences
    As a student
    I want to filter houses
    So that I only see houses that match my preferences
    
Background: Following users exist
  
Given the following users exist:
    | email            | id          |
    | ferrerasjohan@gmail.com | 1    |
    | ddhuri1@binghamton.edu| 2         |
    | scottmason@gmail.com| 3 |

@omniauth_test  
Scenario: See Housing Page
    Given I am signed in with provider "Facebook" 
    Then I am on Dashboard
    Then I should see "Housing"
    When I click on "Housing"
    Then I should see "House Listing"
    
@omniauth_test  
Scenario: See Housing Page
    Given I am signed in with provider "Github" 
    Then I am on Dashboard
    Then I should see "Housing"
    When I click on "Housing"
    Then I should see "House Listing"