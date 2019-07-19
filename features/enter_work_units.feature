Feature: Enter work units
As a user
I can enter work units (hours and such) for each day on the calendar
So that I can track what I'm owed for them

Background:
  Given I am logged in
  And I have no work units

Scenario Outline: Basic entry
  When I enter <amount> of work on <date>
  And I go to the home page
  Then I should see <amount> of work on <date>

  Examples:
 | amount  | date        |
 | 3 hours | 10 Oct 2015 |

Scenario: Can't see other users' work units
  Given another user has a work unit
  When I go to the home page
  Then I should not see any work units
