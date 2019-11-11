Feature: Edit unpaid work units
As a user
I can edit information for my existing unpaid work units
So I can correct data entry errors

Background:
  Given I am logged in

Scenario: Link from view to edit
  Given I have a work unit
  And I am on the home page
  When I click "Edit" within the work unit
  Then I should be on the work unit's edit page

Scenario: Can't edit paid work unit
  Given I have a paid work unit
  And I am on the home page
  Then I should not see "Edit" within the work unit
  And I should not be able to get to the work unit's edit page

Scenario: Can't edit other users' work units
  Given another user has a work unit
  Then I should not be able to get to the work unit's edit page

Scenario Outline: Edit all fields of work unit
  Given I have the following clients:
    | name | <client1> | <client2> |
  And I have the following work unit:
    | description   | <desc_old>  |
    | client        | <client1>   |
    | decimal hours | <hours_old> |
    | pay           | <pay_old>   |
    | payment due   | <due_old>   |
  And I am on the work unit's edit page
  When I fill in the following:
    | Description    | <desc_new>  |
    | Hours          | <hours_new> |
    | Payment amount | <pay_new>   |
    | Payment due    | <due_new>   |
    | Client         | <client2>   |
  And I click "Save"
  Then I should be on the home page
  And I should see the following work unit:
  | Description    | <desc_new>  |
  | Client         | <client2>   |
  | Hours          | <hours_new> |
  | Payment amount | <pay_new>   |
  | Payment due    | <due_new>   |
  But I should not see the following work unit:
  | Description    | <desc_old>  |
  | Client         | <client1>   |
  | Hours          | <hours_old> |
  | Payment amount | <pay_old>   |
  | Payment due    | <due_old>   |

  Examples:
    | client1 | client2  | desc_old | desc_new | hours_old | hours_new | pay_old | pay_new | due_old    | due_new    |
    | TRW     | Experian | Steal    | Liberate | 1         | 2         | 100     | 250     | 1 Jan 2019 | 5 Feb 2020 |
