Feature: ID14_Edit member information in the project
	
	As a Project Leader
	I would like to edit a member information
	So that all members know the member's title, company and time zone in the project
	
	Background:
		Given that the Project leader is logged in
		And the project has been created 
		And I am on the project
	
	Scenario Outline: I successfully edit a member information (Normal Flow)
		When I access the members of the project 
		And I click "Edit" label for a member
		And I edit the member informations
		Then the member's information should be successfully edited
		
	Scenario: I fail to edit a member information because I am not the Admin (Error Flow)
		When I access the members of the project 
		But I am not the Admin
		And I click "Edit" label for a member
		Then member information should not be edited
		And I see the error message "You can’t change the member's info, because you didn’t add them and you’re not an Admin."