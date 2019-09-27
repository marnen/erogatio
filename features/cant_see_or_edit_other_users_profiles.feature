Feature: Can't see or edit other users' profiles
As a user
I can't see or edit other users' profiles
So that we're all in control of our own data

Scenario Outline:
  Given a user exists
  And I am <status>
  Then I should not be able to get to the user's <page> page

  Examples:
    | status        | page   |
    | logged in     | detail |
    | logged in     | edit   |
    | not logged in | detail |
    | not logged in | edit   |
