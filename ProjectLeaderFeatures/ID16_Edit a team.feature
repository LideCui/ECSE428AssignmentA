Feature: ID16_Edit a team
	
	User Stories:	
	As a Project Leader
	I want to be able to edit a team with a team name and description
	So that the team members can understand the team's concept
	
	Background:
		Given that the Project leader is logged in
		And that the following team exists:
		    | teamName    | key  |
            | Team        | TEAM |
	
	Scenario Outline: I successfully edit the team (Normal Flow)
		When I access the team with name <name> and key <key>
		And I request to edit the team's name and description
		Then the team should be successfully edited in the system