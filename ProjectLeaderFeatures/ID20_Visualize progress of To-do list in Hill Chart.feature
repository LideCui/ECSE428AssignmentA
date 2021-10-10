Feature: ID20_Visualize progress of To-do list in Hill Chart
	
	User Stories:	
	As a Project Leader
	I want to be able to see the progress of To-do tasks in Hill Chart 
	So that I can track the progress of the project.
	
	Background:
		Given I am a Project Leader
		And I am assigned to a Project
		
	Scenario: The Hill chart of task is successfully shown (Normal Flow) 
		When I am in To-Do section
		And I request to view the Hill chart of To-do tasks
		Then I can successfully see a Hill chart with each dot represent a To-do task
	
	Scenario: The Hill chart of task is not shown (Error Flow) 
		When I request to show Hill chart of To-do tasks 
		But no Hill chart has been created for To-Do list
		Then I see a warning message "No Hill chart to show"