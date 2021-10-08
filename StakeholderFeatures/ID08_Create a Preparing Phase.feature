Feature: ID08_Create a Preparing Phase

    User Stories:
    As a Stakeholder
    I want to be able to create a Preparing Phase for the Company Group
    With a name, start date and end date
    So that we can decide on which project(s) the company will be working on


    Background:
        Given that the stakeholder is logged in
        And a Company Group with name <name> and key <key> exists

    Scenario: (Normal Flow) Create a Preparing Phase for an existing Company Group
        When the stakeholder requests to create a Preparing phase
        And provided a valid name <name>, a valid start date <start date> and a valid end
        date <end date>
        And the end date <end date> is after the start date <start date>
        Then a new Preparing phase is created

    Scenario: (Error Flow) Create a Preparing Phase for an existing Company Group where start date is after end date
        When the stakeholder requests to create a Preparing phase
        And provided a valid name <name>
        And provided a start date <start date>
        And provided an end date <end date> which is before the start date <start date>
        Then the system throws an “The end date cannot be before the start date” error
        And no new Preparing phase is created

    Scenario: (Error Flow) Create a Preparing Phase for an existing Company Group without a name
        When the stakeholder requests to create a Preparing phase
        And provided a valid start date <start date> and a valid end date <end date>
        And left the name empty
        Then the system throws an “A Preparing phase must have a name” error
        And no new Preparing phase is created

    Scenario: (Error Flow) Create A Preparing Phase for an existing Company Group without any dates
        When the stakeholder requests to create a Preparing phase
        And provided a valid name <name>
        And left start date and end date empty
        Then the system throws an “A Preparing phase must have a start date and an end date” error
        And no new Preparing phase is created