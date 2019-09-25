Feature: Enter payment for work units
As a user
I can enter a payment for a work unit
So that I know I've been paid for that work unit

Scenario Outline:
  Given I am logged in
  And I have the following work unit:
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
