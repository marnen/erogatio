Feature: Register a user account
As an unregistered user
I can register an account
So that I can use the application to track my work and payment

Scenario Outline:
  Given I am not logged in
  And no users exist
  When I go to the new user page
  And I fill in the following:
    | E-mail address   | <email>    |
    | Password         | <password> |
    | Password confirmation | <password> |
  And I click "Create User"
  Then I should see "Your account was successfully created. Please log in."
  And I should be on the login page
  When I fill in the following:
    | E-mail address | <email>    |
    | Password       | <password> |
  And I click "Log In"
  Then I should be logged in as "<email>"

  Examples:
    | email              | password        |
    | joe.user@gmail.com | s3kr1t påssw0rd |

Scenario: Link from login page
  Given I am not logged in
  And I am on the login page
  When I click "sign up"
  Then I should be on the new user page
