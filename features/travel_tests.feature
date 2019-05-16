
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
    Then I should see "Off Campus Housing Guide"