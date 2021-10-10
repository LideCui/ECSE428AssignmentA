Feature: ID01_Create a Company Group

    User Stories:
    As a stakeholder
    I want to be able to able to create a group for my company
    With a company name and a key
    So that I can manage the projects that we are working on as a company

    Background:
        Given the stakeholder is logged in

    Scenario Outline: (Normal Flow) Creating a Company Group with a name and a key
        When the stakeholder clicks on “Create a Company Group” button
        And the stakeholder enters name <name> and upload a key <key>
        Then the stakeholder clicks on “Create” button
        And a new company group with name <name> and key <key> is created

    Scenario Outline: (Error Flow) Creating a Company Group without a name or a key
        When the stakeholder clicks on “Create a Company Group” button
        And the stakeholder clicks on “Create” button
        Then the system throws an “Company cannot be created without a name or a key” error