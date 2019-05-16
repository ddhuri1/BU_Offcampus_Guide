Feature:
    As a User
    I want to successfully login in given valid EmailId and Password
    So I can see the Dashboard

Background: Following users exist
    Given the following users exist:
    | email            | id          |
    | ferrerasjohan@gmail.com | 1    |
    | ddhuri1@binghamton.edu| 2         |
    | scottmason@gmail.com| 3   |

@omniauth_test
Scenario: See Login Page
    When I am on Home Page
    Then I should see "Welcome to The Off Campus Housing Guide"
    Then I should see "Log in"
    Then I should see "Register or Log In With Github"
    And I should see "Register or Log In With Facebook"

@omniauth_test
Scenario: Successfully Log in
    Given I am signed in with provider "Github"
    Then I am on Dashboard
    Then I should see "Dashboard" 
    #Then I should see "Welcome to The Off Campus Housing Guide Log in Register or Log In With GitHub Register or Log In With Facebook"
    
@omniauth_test
Scenario: Successfully Log in
    Given I am signed in with provider "Facebook"
    Then I am on Dashboard
    Then I should see "Dashboard"