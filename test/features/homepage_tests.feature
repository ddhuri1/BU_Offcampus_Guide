Feature:
    As a User
    I want to see the new page when I click on the button provided to open the New Page 
    So that I can view and explore the information

Scenario: User sees login Page
    When I am on Home Page
    When I click on "Sign In"
    Then I should be on the page with the title: Login Page
    When I click on "Sign Up"
    Then I should be on the page with the title: New User
    When I click on "Sign In As Guest"
    Then I should be on the page with the title: Guest Sign In