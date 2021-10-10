Feature: ID11_Add members to a project
	
	As a Project Leader
	I would like to add a member to the project
	So that member can collaborate through the project section
	
	Background:
		Given that the Project leader is logged in
		And that the following Project exists:
	        | name    | key  |
            | Project | PROJ |
	
	Scenario Outline: A new member is successfully added to the project (Normal Flow)
		When I access the members of the project with name <name> and key <key>
		And I enter the member valid name and email 
		And I request to add the member to the project
		Then an email containing an invitation link to Basecamp project is sent to the person
	
	Scenario: A new member fails to be added because the email is not entered (Error Flow)
		When I access the members of the project with name <name> and key <key>
		And I enter the member valid name 
		But I don't input a valid email
		And I request to add the member to the project 
		Then the email containing an invitation link to Basecamp project should not be sent to the person
		And I should see the error message "Make sure you’ve provided a name and email for all new people."
		
	Scenario: A new member fails to be added because the name is not entered (Error Flow)
		When I access the members of the project with name <name> and key <key>
		And I enter the member valid email 
		But I don't input a name
		And I request to add the member to the project 
		Then the email containing an invitation link to Basecamp project should not be sent to the person
		And I should see the error message "Make sure you’ve provided a name and email for all new people."
		
	Scenario: A new member fails to be added because they are already a member of the project (Error Flow)
		When I access the members of the project with name <name> and key <key>	
		And I enter the member valid name 
		And I enter the member valid email 
		But the member is already in the project
		Then the email containing an invitation link to Basecamp project should not be sent to the person