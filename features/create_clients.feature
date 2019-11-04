Feature: Create clients
As a user
I can create clients
So that I can record whom I did work for

Background:
  Given I am logged in

Scenario Outline: Basic client entry
  Given I have no clients
  When I go to the client entry page
  And I fill in the following:
    | Name | <name> |
  And I click "Save"
  Then I should be on the clients page
  And I should see the following client:
    | Name | <name> |

  Examples:
    | name              |
    | Acme Contraptions |

Scenario Outline: Can't see others' clients
  Given another user has the following client:
    | name | <name> |
  When I go to the clients page
  Then I should not see the following client:
    | Name | <name> |

  Examples:
    | name                   |
    | Someone Else's Problem |

Scenario: Link from client index
  Given I am on the clients page
  When I click "Enter new client"
  Then I should be on the client entry page
