Feature: Register a user account
As an unregistered user
I can register an account
So that I can use the application to track my work and payment

Scenario Outline:
  Given no users exist
  When I go to the new user page
  And I fill in the following:
    | E-mail address   | <email>    |
    | Password         | <password> |
    | Password confirmation | <password> |
  And I click "Create User"
  And I go to the login page
  And I fill in the following:
    | E-mail address | <email>    |
    | Password       | <password> |
  And I click "Log In"
  Then I should be logged in as "<email>"

  Examples:
    | email              | password        |
    | joe.user@gmail.com | s3kr1t påssw0rd |
