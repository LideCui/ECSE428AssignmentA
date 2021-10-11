Feature: ID13_Remove members to a project
	
	User Stories:	
	As a Project Leader
	I would like to be able to remove a member from the project
	So that only required members are part of the project
	
	Background:
		Given that the Project leader is logged in
		And that the following Project exists:
	        | name    | key  |
            | Project | PROJ |
	
	Scenario Outline: I successfully remove a member from the project (Normal Flow)
		When I access the members of the project with name <name> and key <key>
		And I request to remove the member 
		Then the member should be successfully removed from the project
	
	Scenario: I fail to remove a member from the project because no members are in the project (Error Flow)
		When I access the members of the project
		And I request to remove a member 
		But I am the only member of the project
		Then I fail to remove a member
		And I should see the warning message "You’re the only person with access to this project, so you can’t remove yourself. You’ll need to invite other people first, or you can archive or delete the project instead."