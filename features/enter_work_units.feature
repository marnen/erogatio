Feature: Enter work units
As a user
I can enter work units (hours and such) for each day on the calendar
So that I can track what I'm owed for them

Background:
  Given I am logged in
  And I have no work units

Scenario Outline: Basic entry
  When I enter <amount1> of work for "<description1>" on <date1>
  And I enter <amount2> of work for "<description2>" on <date2>
  And I go to the home page
  Then I should see <amount1> of work for "<description1>" on <date1>
  And I should see <amount2> of work for "<description2>" on <date2>

  Examples:
 | amount1   | date1       | description1 | amount2   | date2      | description2      |
 | 3.0 hours | 10 Oct 2015 | Dr. Evil     | 4.5 hours | 1 Jan 2016 | Save the Children |

Scenario Outline: Entry of all fields
  Given I am on the work unit entry page
  When I fill in the following:
    | Hours          | <hours>       |
    | Date           | <date>        |
    | Description    | <description> |
    | Payment amount | <pay>         |
    | Payment due    | <due_date>    |
  And I click "Save"
  And I go to the home page
  Then I should see the following work unit:
    | Hours       | <hours>       |
    | Date        | <date>        |
    | Description | <description> |
    | Pay         | <pay>         |
    | Payment Due | <due_date>    |

  Examples:
    | hours     | date       | description | pay   | due_date    |
    | 2.0 hours | 4 Jul 2019 | Fireworks   | 20.50 | 10 Jul 2019 |

Scenario: Can't see other users' work units
  Given another user has a work unit
  When I go to the home page
  Then I should not see any work units

Scenario: Can't enter time if not logged in
  Given I am not logged in
  When I go to the home page
  Then I should be on the login page

Scenario: Link from home page to entry
  Given I am on the home page
  When I click "Enter work unit"
  Then I should be on the work unit entry page
