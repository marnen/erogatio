Feature: Can't see other users' detail pages
As a user
I can't see other users' detail pages
So that the system doesn't leak data

Scenario Outline:
  Given a user exists
  And I am <status>
  Then I should not be able to get to the user's detail page

  Examples:
    | status        |
    | logged in     |
    | not logged in |
