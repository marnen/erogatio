Feature: Enter work units
As a user
I can enter work units (hours and such) for each day on the calendar
So that I can track what I'm owed for them

Background:
  Given I am logged in
  And I have no work units

Scenario Outline: Basic entry
  When I enter <amount1> of work on <date1>
  And I enter <amount2> of work on <date2>
  And I go to the home page
  Then I should see <amount1> of work on <date1>
  Then I should see <amount2> of work on <date2>

  Examples:
 | amount1 | date1       | amount2 | date2      |
 | 3 hours | 10 Oct 2015 | 4 hours | 1 Jan 2016 |

Scenario: Can't see other users' work units
  Given another user has a work unit
  When I go to the home page
  Then I should not see any work units
