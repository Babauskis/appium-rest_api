Feature: Login feature
  Test the login functionality of apimation.com

  Scenario: Positive login
    When I log in apimation.com as a regular user
    Then I check if I am logged in and I can access my personal information

  Scenario: Negative login
    When I try to log in apimation.com with a wrong password
    Then I check if I am not logged in and I cannot access my personal data

  Scenario: Create project
    When I log in apimation.com as a regular user
    Then I create new project
    Then I create new environments

  Scenario: Create something
    When I log in apimation.com as a regular user
    Then I create new project
    Then I choose existing project
    Then I create TESTAPI request collection