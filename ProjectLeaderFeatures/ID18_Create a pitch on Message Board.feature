Feature: ID18_Create a pitch on Message Board

	User Stories:	
	As a Project Leader
	I want to be able to create a pitched message on Message Board 
	So that I can announce the project details for next cycle
		
	Background:
		Given that I am logged in
		And a project has been created
		And I added at least one member
		
	Scenario Outline: (Normal Flow) I successfully create a pitched message on Message Board 
		When I request to create a New Massage on Message Board
		And I edit message title and contents for project details
		And I pick Message category as “Pitch”
		And I request to post the Message on Board
		Then the pitched message is successfully created
		And the pitched message can be viewed by all project members
		
	Scenario: (Error Flow) I fail to create a pitched message
		When I request to create a New Massage on Message Board 
		And I edit message title and contents for project details 
		But I do not choose Message category as “Pitch”
		Then a new message is created but not a Pitch
		And I fail to create a pitched message