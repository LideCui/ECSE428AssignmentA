Feature: ID05_Add Team Members to the Company Group

    User Stories:
    As a Stakeholder
    I want to be able to add team members to the Company Group
    So that I can create a team that will work on the greenlighted projects


    Background:
        Given that the stakeholder is logged in
        And that there is a Company Group with name <name> and key <key> exists
        And the following Team Members exists:


    Scenario Outline: (Normal Flow) Adding an existing Team Member to the Company Group with their name
        When the stakeholder clicks on “Invite Members” button
        And the stakeholder enters name <name> of the Team Member
        Then the Team Member is invited to the Company Group

        Examples:
            | name    | email         | role        |
            | member1 | mem1@test.com | Team Member |
            | member2 | mem2@test.com | Team Member |

    Scenario Outline: (Alternative Flow) Adding an existing Team Member to the Company Group with their email
        When the stakeholder clicks on “Invite Members” button
        And the stakeholder enters email <email> of the Team Member
        Then the Team Member is invited to the Company Group

    Scenario Outline: (Error Flow) Adding a non-existing Team Member to the Company Group
        When the stakeholder clicks on “Invite Members” button
        And the stakeholder enters email <email> of a non-existing Team Member
        Then the system throws an “User cannot be found” error