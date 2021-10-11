Feature: ID14_Edit member information in the project
	
	User Stories:	
	As a Project Leader
	I would like to edit a member information
	So that all members know the member's title, company and time zone in the project
	
	Background:
		Given that the Project leader is logged in
		And that the following Project exists:
	        | name    | key  |
            | Project | PROJ |
	
	Scenario Outline: (Normal Flow) I successfully edit a member information 
		When I access the members of the project with name <name>
		And I request to edit the member title informations
		Then the member's information should be successfully edited
		
	Scenario: (Error Flow) I fail to edit a member information because I am not the Admin
		When I access the members of the project with name <name> 
		But I am not the Admin
		And I request to edit a member information
		Then member information should not be edited
		And I see the error message "You can’t change the member's info, because you didn’t add them and you’re not an Admin."