Feature:
    As user
    User should see the list of grocery stores nearby. User may have option to filter them by distance.
    User should see the list of Medical services nearby. User may have option to filter them by distance and the services they provide.
    User should see the list of all the household services nearby. User may have option to filter them by distance and the category.
    User should see the list of Clothes stores nearby.
    
Background: Following users exist
  
Given the following users exist:
    | email            | id          |
    | ferrerasjohan@gmail.com | 1    |
    | ddhuri1@binghamton.edu| 2         |
    | scottmason@gmail.com| 3 |
    
@omniauth_test  
Scenario: See Essentials Page
    Given I am signed in with provider "Facebook" 
    Then I am on Dashboard
    Then I should see "Essentials"
    When I click on "Essentials"
    Then I should see "ESSENTIALS"
    When I click "Grocery"
    Then I should see "Add new store"
    When I click "Add new store"
    Then I should see "Create New Grocery Store"
    When I click "Medical"
    Then I should see "Add new Medical"
    When I click "Add new Medical"
    Then I should see "Create New Medical"
    When I click "Household"
    Then I should see "Add new store"
    When I click "Add new store"
    Then I should see "Create New Store"
    When I click "Clothing"
    Then I should see "Add new store"
    When I click "Add new store"
    Then I should see "Create New Clothing Store"
    
@omniauth_test  
Scenario: See Essentials Page
    Given I am signed in with provider "Github" 
    Then I am on Dashboard
    Then I should see "Essentials"
    When I click on "Essentials"
    Then I should see "ESSENTIALS"
    When I click "Grocery"
    Then I should see "Add new store"
    When I click "Add new store"
    Then I should see "Create New Grocery Store"
    When I click "Medical"
    Then I should see "Add new Medical"
    When I click "Add new Medical"
    Then I should see "Create New Medical"
    When I click "Household"
    Then I should see "Add new store"
    When I click "Add new store"
    Then I should see "Create New Store"
    When I click "Clothing"
    Then I should see "Add new store"
    When I click "Add new store"
    Then I should see "Create New Clothing Store"
    