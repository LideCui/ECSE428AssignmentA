Feature: ID04_Add Project Leaders to the Company Group

    User Stories:
    As a Stakeholder
    I want to be able to add Project Leaders to my Company Group
    So that we can start Shaping and Betting phase of the Shape Up


    Background:
        Given that the stakeholder is logged in
        And that there is a company group with name <name> and key <key> exists
        And the following Project Leaders exists:


    Scenario Outline: (Normal Flow) Adding an existing Project Leader to the Company Group with their name
        When the stakeholder clicks on “Invite Leaders” button
        And the stakeholder enters name <name> of the Project Leader
        Then the Project Leader is invited to the Company Group

        Examples:
            | name  | email          | role           |
            | test1 | test1@test.com | Project Leader |
            | test2 | test2@test.com | Project Leader |

    Scenario Outline: (Alternative Flow) Adding an existing Project Leader to the Company Group with their email
        When the stakeholder clicks on “Invite Leaders” button
        And the stakeholder enters email <email> of the Project Leader
        Then the Project Leader is invited to the Company Groupd

    Scenario Outline: (Error Flow) Adding a non-existing Project Leader to the Company Group
        When the stakeholder clicks on “Invite Leaders” button
        And the stakeholder enters email <email> of a non-existing Project Leader
        Then the system throws an “User cannot be found” error