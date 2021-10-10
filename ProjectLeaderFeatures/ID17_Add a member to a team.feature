Feature: ID17_Add a member to a team
	
	As a Project Leader
	I would like to add a member to the team
	So that the member can collaborate through the project section
	
	Background:
		Given that the Project leader is logged in
		And the team has been created
		And I am on the team 
	
	Scenario Outline: A new member is successfully added to the team (Normal Flow)
		When I enter the member valid name 
		And I enter the member valid email 
		And I request to add the member to the team
		Then an email containing an invitation link to Basecamp team is sent to the person
	
	Scenario: A new member fails to be added to the team because the email is not entered (Error Flow)
		When I enter the member valid name 
		And I request to add the member to the project 
		Then the email containing an invitation link to Basecamp project should not be sent to the person
		And I should see the error message "Make sure you’ve provided a name and email for all new people."
		
	Scenario: A new member fails to be added to the team because the name is not entered (Error Flow)
		When I enter the member valid email 
		And I request to add the member to the project 
		Then the email containing an invitation link to Basecamp project should not be sent to the person
		And I should see the error message "Make sure you’ve provided a name and email for all new people."
		
	Scenario: A new member fails to be added because they are already a member of the project (Error Flow)
		When I enter the member valid name 
		And I enter the member valid email 
		But the member is already in the project
		Then the email containing an invitation link to Basecamp project should not be sent to the person