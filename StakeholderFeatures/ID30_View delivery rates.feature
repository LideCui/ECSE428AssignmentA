Feature: ID30_View a project's flow system

    User Stories:
    As a team member
    I want to be able to able to view my assigned project's delivery rate
    So that I can track the speed at which the project is progressing

    Background:
        Given the team member is logged in
        And is assigned to at least one project
        And the page of the flow system of one of those projects is open

    Scenario: (Normal Flow) Viewing a project's delivery rate for a project the team member is a part of
        When the team member clicks the button “Project Metrics”
        Then the page of the project metrics with delivery rate, Little's Law 
        and a cumulative flow diagram shall be displayed