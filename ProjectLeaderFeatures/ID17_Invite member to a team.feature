Feature: ID17_Invite member to a team
	
	User Stories:	
	As a Project Leader
	I would like to invite a member to the team
	So that members can collaborate and communicate through the team section	
	
	Background:
		Given that the Project leader is logged in
		And that the team has been created
	
	Scenario Outline: A new member is successfully added to the team (Normal Flow)
		When I enter the member valid name <name> and corresponding email <email>
		And I request to add the member to the team
		Then an email containing an invitation link to Basecamp team is sent to the person
			| name         | email                 |
			| Member       | member@gmail.com      |
			| Other Member | othermember@gmail.com |
			
	Scenario: A new member fails to be added to the team because the email is not entered (Error Flow)
		When I enter the member valid name <name>
		But I don't input a valid email <email>
		And I request to add the member to the team
		Then the email containing an invitation link to Basecamp team should not be sent to the person
		And I should see the error message "Make sure you’ve provided a name and email for all new people."
			| name | email       |
  			| test | invalidemail|
  			
	Scenario: A new member fails to be added to the team because the name is not entered (Error Flow)
		When I enter the member valid email <email>
		But I do not input a name		
		And I request to add the member to the team 
		Then the email containing an invitation link to Basecamp team should not be sent to the person
		And I should see the error message "Make sure you’ve provided a name and email for all new people."
		
	Scenario: A new member fails to be added because they are already a member of the team (Error Flow)
		Given member with name <name> and email <email> already exists
		When I enter the member valid name <name> and corresponding email <email>
		And I request to add the member to the team
		Then the email containing an invitation link to Basecamp team should not be sent to the person