Feature: Questions and question pages
As an author
so that I can manage my questions
I want to add new questions and anwser questions

Scenario: link to new question page
  Given I'm on the paper show page
  When I click New Question button
  Then I should be able to see the new question's page

Scenario: Add a new question
  Given I'm on the paper show page
  When I click New Question button
  Then I should be able to see the new question's page

Scenario: Add a question without content
  Given I'm on the new question page
  When I add a new question without content
  Then I should see some errors on the page
