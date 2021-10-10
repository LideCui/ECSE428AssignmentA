Feature: ID18_Create a pitch on Message Board

	As a Project Leader
	I want to be able to create a pitched message on Message Board 
	So that I can announce the project details for next cycle
		
	Background:
		Given that I am logged in
		And I created a project
		And I added at least one member
		
	Scenario: I successfully create a pitched message on Message Board (Normal Flow) 
		When I request to create a New Massage on Message Board
		Then I edit message title and contents for project details
		And I pick Message category as “Pitch”
		And I post the Message on Board
		Then the pitched message is successfully created
		And the pitched message can be viewed by all project members
		
	Scenario: I fail to create a pitched message (Error Flow)
		When I create a New Massage on Message Board 
		Then I edit message title and contents for project details 
		And I do not choose Message category as “Pitch”
		Then a new message is created but not a Pitch
		Then I fail to create a pitched message