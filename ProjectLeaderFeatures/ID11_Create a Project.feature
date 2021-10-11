Feature: ID11_Create a Project
   
    User Stories:
    As a Project Leader
    I would like to create a new project with a given name
    So that it can be ready for building
	
    Background:
		Given that the Project leader is logged in
	
    Scenario Outline: (Normal Flow) I successfully create a new project
		When I request to add a new project
		And I assign a project name <name>
		Then the project should be successfully created in the system
	
    Scenario: (Error Flow) I don't successfully create a project because I input an invalid name
		When I request to add a new project
		And I do not assign a project name
		Then the project should not be created in the system
		And the system warns me that a project name should be assigned