Feature:
    As a User
    I want to successfully login in given valid EmailId and Password
    So I can see the Dashboard

Background: Following users exist
    Given the following users exist:
    | username  | password      | emailID               |
    | ddhuri    | ddhuri        |ddhuri@binghamton.edu  |
    | purva13   | purva13       |purva13@binghamton.edu |

Scenario: See Login Page
    When I am on Home Page
    And I should see "Welcome to The Off Campus Housing Guide"
    Then I should see "Log in"
    Then I should see "Register or Log In With GitHub"
    And I should see "Register or Log In With Facebook"
Scenario: Successfully Log in
    When I am on Home Page
    #And I fill in "emailID" with "ddhuri@binghamton.edu"
    #And I fill in "username" with "ddhuri"
    #And I fill in "password" with "ddhuri"
    And I fill in right emailID
    And I fill in right password
    Then I click on "Sign In"
    #Then I should see "Valid Registration"
    Then I should be on the page with the title: Login Page

Scenario: Failed Log in
    When I am on Home Page
    #And I fill in "emailID" with "jstone1@binghamton.edu"
    #And I fill in "username" with "jarrod_stone"
    #And I fill in "password" with "jstone1"
    And I fill in wrong emailID
    And I fill in wrong password
    Then I click on "Sign In"
    And I am on Home Page
    #Then I should see "Invalid Registration"