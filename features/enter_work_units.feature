Feature: Enter work units
As a user
I can enter work units (hours and such) for each day on the calendar
So that I can track what I'm owed for them

Scenario Outline:
  Given I am logged in
  And I have no work units
  And I am on the home page
  When I enter <amount> of work on <date>
  And I go to the home page
  Then show me the page
  Then I should see <amount> of work on <date>

  Examples:
 | amount  | date        |
 | 3 hours | 10 Oct 2015 |
