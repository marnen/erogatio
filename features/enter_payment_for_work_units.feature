Feature: Enter payment for work units
As a user
I can enter a payment for a work unit
So that I know I've been paid for that work unit

Background:
  Given I am logged in

Scenario Outline: Enter and display payment for work units
  Given I have the following work unit:
    | description | <description> |
    | pay         | <pay>         |
  When I go to the work units page
  And I click "Enter payment" within the work unit
  And I fill in the following:
  | Date   | <pay_date> |
  | Amount | <pay>      |
  And I click "Save"
  Then I should be on the work units page
  And I should see "Paid on <pay_date>" within the work unit

  Examples:
    | description    | pay    | pay_date    |
    | My awesome job | 125.75 | 10 Oct 2019 |

Scenario: Unpaid work units don't show as paid
  Given I have a work unit
  And I am on the work units page
  Then I should not see "Paid on"

Scenario: Can't enter payment when not logged in
  Given I have a work unit
  When I log out
  Then I should not be able to get to the payment entry page for the work unit

Scenario: Can't enter payment for others' work units
  Given another user has a work unit
  Then I should not be able to get to the payment entry page for the work unit
