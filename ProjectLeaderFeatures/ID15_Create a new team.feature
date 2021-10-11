Feature: ID15_Create a new team

	User Stories:	
	As a Project Leader
	I want to be able to create a new team 
	So that the members can collaborate and communicate through the team section 
	
	Background:
		Given that the Project leader is logged in
	
	Scenario Outline: (Normal Flow) I successfully create a new team
		When I request to create a new team
		And I assign a team name 
		Then the team should be successfully created in the system
			
	Scenario: (Error Flow) I don't successfully create a new because I input an invalid name 
		When I request to create a new team
		And I do not assign a team name
		Then the team should not be created in the system
		And the system warns me that a team name should be assigned