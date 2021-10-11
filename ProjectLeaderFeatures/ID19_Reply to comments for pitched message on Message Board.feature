Feature: ID19_Reply to comments for pitched message on Message Board
	
	User Stories:	
	As a Project Leader
	I want to be able to reply comments for the pitched message
	So that I can answer project members questions about pitched message
	
	Background:
		Given I am a Project Leader of the project 
		And I posted a pitched message on the project
		
	Scenario: I successfully reply comments on pitched message (Normal Flow) 
		When I request to add comments to a pitched message
		And I input my comments
		Then the comment is added to the pitched message
		And the system displays my comment in the comment list of the pitched message
		
	Scenario: I fail to reply to comments on the Pitch because I add a blank comment (Error Flow)
		When I request to add a comment to the pitched message 
		But I do not input my comment
		Then the comment is not added to the Epic
		And I see a error message saying "Blank comments can’t be added to an pitched message"