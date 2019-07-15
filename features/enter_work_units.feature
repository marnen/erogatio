Feature: Enter work units
As a user
I can enter work units (hours and such) for each day on the calendar
So that I can track what I'm owed for them

Scenario:
  Given I am logged in
  And I have no work units
  And I am on the home page
  When I enter 3 hours of work
  And I go to the home page
  Then I should see 3 hours of work
