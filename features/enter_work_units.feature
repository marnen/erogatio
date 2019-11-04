Feature: Enter work units
As a user
I can enter work units (hours and such) for each day on the calendar
So that I can track what I'm owed for them

Background:
  Given I am logged in
  And I have no work units

Scenario Outline: Basic entry
  Given I have the following clients:
    | name | <client1> | <client2> |
  When I enter the following work units:
    | Client      | <client1>      | <client2>      |
    | Hours       | <hours1>       | <hours2>       |
    | Date        | <date1>        | <date2>        |
    | Description | <description1> | <description2> |
  And I go to the home page
  Then I should see the following work units:
    | Client      | <client1>      | <client2>      |
    | Hours       | <hours1>       | <hours2>       |
    | Date        | <date1>        | <date2>        |
    | Description | <description1> | <description2> |

  Examples:
 | client1  | hours1    | date1       | description1  | client2           | hours2    | date2      | description2 |
 | Dr. Evil | 3.0 hours | 10 Oct 2015 | Flamethrowing | Save the Children | 4.5 hours | 1 Jan 2016 | Fundraising  |

Scenario Outline: Entry of all fields
  Given I have the following client:
    | name | <client> |
  When I enter the following work unit:
    | Client         | <client>      |
    | Hours          | <hours>       |
    | Date           | <date>        |
    | Description    | <description> |
    | Payment amount | <pay>         |
    | Payment due    | <due_date>    |
  And I go to the home page
  Then I should see the following work unit:
    | Client      | <client>      |
    | Hours       | <hours>       |
    | Date        | <date>        |
    | Description | <description> |
    | Pay         | <pay>         |
    | Payment Due | <due_date>    |

  Examples:
    | client  | hours     | date       | description | pay   | due_date    |
    | Initech | 2.0 hours | 4 Jul 2019 | Fireworks   | 20.50 | 10 Jul 2019 |

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
