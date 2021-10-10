Feature: ID15_Create a new team

	User Stories:	
	As a Project Leader
	I want to be able to create a new team 
	So that the members can collaborate using 
	
	Background:
		Given that the Project leader is logged in
	
	Scenario Outline: I successfully create a new team (Normal Flow)
		When I request to create a new team
		And I assign a team name 
		Then the team should be successfully created in the system
			
	Scenario: I don't successfully create a new because I input an invalid name (Error Flow)
		When I request to create a new team
		And I do not assign a team name
		Then the team should not be created in the system
		And the system warns me that a team name should be assigned