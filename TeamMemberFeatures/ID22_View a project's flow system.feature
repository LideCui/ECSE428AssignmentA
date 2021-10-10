Feature: ID22_View a project's flow system

    User Stories:
    As a team member
    I want to be able to able to view my assigned project's flow systems
    So that I can track the current status of my projects

    Background:
        Given the team member is logged in
        And a page which displays the team member's assigned projects is open

    Scenario: (Normal Flow) Viewing a project's flow system for a project the member is a part of
        When the team member requests to view the project with name <projectName>
        Then a page with the flow system with name <projectName> shall be displayed

    Scenario: (Error Flow) Viewing a project's flow system for a project the member is not a part of
        When the team member is removed from the project with name<projectName>
        And the team member requests to view the project with name <projectName>
        Then the team member should get an error message