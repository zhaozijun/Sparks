Feature: signin as author, manage papers

  Scenario: Add a new paper
    Given I've successfully signed in
    Then I want to create a new paper
    When I add a new title and upload files
    Then I should be able to see the new paper's page

  Scenario: Delete uploaded paper
    Given I've successfully signed in
    Then I want to delete an existed paper
    When I click destroy
    Then I can delete an existed paper

  Scenario: Edit existed paper
    Given I've successfully signed in
    Then I want to edit an existed paper
    When I check the remove box
    Then the file I uploaded before can be removed
