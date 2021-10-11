Feature: ID11_Add members to a project

	User Stories:	
	As a Project Leader
	I would like to add a member to the project
	So that member can collaborate through the project section
	
	Background:
		Given that the Project leader is logged in
		And that the project has been created
	
	Scenario Outline: (Normal Flow) A new member is successfully added to the project
		When I request to add a member to the project
		And I enter the member valid name <name> and email <email>
		Then an email containing an invitation link to Basecamp project should be sent to the person
		
		Examples:
			| name         | email                 |
			| Member       | member@gmail.com      |
			| Other Member | othermember@gmail.com |
		
	Scenario: (Error Flow) A new member fails to be added because the email is invalid 
		When I request to add a member to the project
		And I enter the member valid name <name>
		But I enter an invalid email <email>
		Then the email containing an invitation link to Basecamp project should not be sent to the person
		And I should see the error message "Make sure you’ve provided a name and email for all new people."
		
		Examples:
			| name         | email                 |
			| wrong        | wrong@gmail           |
			| Other        | invalid email         |
			| testt        | test                  |
			
	Scenario: (Error Flow) A new member fails to be added because the name is not entered
		When I request to add a member to the project
		And I enter the member valid email <email>
		But I do not input a name <name>
		Then the email containing an invitation link to Basecamp project should not be sent to the person
		And I should see the error message "Make sure you’ve provided a name and email for all new people."
		
	Scenario: (Error Flow)  A new member fails to be added because they are already a member of the project 
		Given member with name <name> and email <email> already exists
		When I request to add a member to the project		
		And I input the existing member name <name> and corresponding email <email> 
		Then the email containing an invitation link to Basecamp project should not be sent to the member
		
		Examples:	
			| name         | email                 |
			| Member       | member@gmail.com      |
			| Other Member | othermember@gmail.com |
		