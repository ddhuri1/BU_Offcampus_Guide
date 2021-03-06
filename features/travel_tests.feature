Feature:
    As user
    I want to see all travel options in and from Binghamton City
    So that I can select an option from Bus, Local, Airports and Cars
    
Background: Following users exist
  
Given the following users exist:
    | email            | id          |
    | ferrerasjohan@gmail.com | 1    |
    | ddhuri1@binghamton.edu| 2         |
    | scottmason@gmail.com| 3 |

@omniauth_test
Scenario: See Travel Page
    Given I am signed in with provider "Facebook"
    Then I am on Dashboard
    Then I should see "Travel"
    When I click on "Travel"
    Then I should see "TRAVEL"
    When I click "Local"
    Then I should see "Add new Local Bus"
    When I click "Add new Local Bus"
    Then I should see "Create New Local Bus"
    When I click "Bus"
    Then I should see "Add new bus"
    When I click "Add new bus"
    Then I should see "Create New Bus"
    When I click "Airports"
    Then I should see "Add new airport"
    When I click "Add new airport"
    Then I should see "Create New Airport"
    When I click "Car Rentals"
    Then I should see "Add new Car Rental"
    When I click "Add new Car Rental"
    Then I should see "Create New Car Rental"

@omniauth_test
Scenario: See Travel Page
    Given I am signed in with provider "Github"
    Then I am on Dashboard
    Then I should see "Travel"
    When I click on "Travel"
    Then I should see "TRAVEL"
    When I click "Local"
    Then I should see "Add new Local Bus"
    When I click "Add new Local Bus"
    Then I should see "Create New Local Bus"
    When I click "Bus"
    Then I should see "Add new bus"
    When I click "Add new bus"
    Then I should see "Create New Bus"
    When I click "Airports"
    Then I should see "Add new airport"
    When I click "Add new airport"
    Then I should see "Create New Airport"
    When I click "Car Rentals"
    Then I should see "Add new Car Rental"
    When I click "Add new Car Rental"
    Then I should see "Create New Car Rental"


    
