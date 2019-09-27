Feature: Don't show list of users to everyone
As a non-admin user or an unregistered user
I cannot see the list of other users
So that the system doesn't leak data to everyone

Scenario Outline: Can't see list of users
  Given I am <status>
  Then I should not be able to get to the users page

  Examples:
    | status        |
    | logged in     |
    | not logged in |
