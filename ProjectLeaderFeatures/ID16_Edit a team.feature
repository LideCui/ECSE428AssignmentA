Feature: ID16_Edit a team
	
	As a Project Leader
	I want to be able to edit a team with a team name and description
	So that the team members can understand the team's concept
	
	Background:
		Given that the team has been created
		And I am on the team section 

	Scenario Outline: I successfully edit the team (Normal Flow)
		When I click on the "Edit" button
		And I edit the team's name and description
		Then the team should be successfully edited in the system