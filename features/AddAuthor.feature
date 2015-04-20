Feature: Create a author, signin and signout

	Scenario: Create a author
		Given I'm on the author creation page
		When I add new author
		Then I should be able to see the new author's homepage
		
	Scenario: Signin successful
		Given I'm on the signin page
		When I login by using right email and password
		Then I should be able to see my page
		
	Scenario: Signout
		Given I'm on the logout page
		Then I should be able to go back to signin page
		
	Scenario: Signin fail
		Given I'm on the signin page
		When I login by using wrong email or password
		Then I should not be able to see my page
		
	