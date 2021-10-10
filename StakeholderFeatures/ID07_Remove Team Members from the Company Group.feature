Feature: ID07_Remove Team Members from the Company Group

    User Stories:
    As a Stakeholder
    I want to be able to remove Team Members from the Company Group
    So that I can keep the Company Group updated with respect to the positional
    changes

    Background:
        Given that the stakeholder is logged in
        And that the Company Group with name <name> and key <key> exists
        And the following Team Members exist:


    Scenario Outline: (Normal Flow) Remove an existing Team Member from the Company Group Settings
        When the stakeholder navigates to the settings of the Company Group with name <name> and key <key>
        And the stakeholder chooses to remove the Team Member with name <name>
        And confirms the removal
        Then the Team Member with name <name> is removed from the Company Group

        Examples:
            | name    | email         | role        | company      | State   |
            | member1 | mem1@test.com | Team Member | Test Company | removed |
            | member2 | mem2@test.com | Team Member | Test Company | removed |

    Scenario Outline: (Alternative Flow) Remove an existing Team Member from the Team Member Profile
        When the stakeholder navigates to the profile of the Team Member with name <name>
        And the stakeholder clicks on “Remove from Company” button
        And confirms the removal
        Then the Team Member with name <name> is removed from the Company Group

    Scenario Outline: (Error Flow) Remove an existing Team Member from the Company Group Settings without confirmation
        When the stakeholder navigates to the settings of the Company Group with name <name> and key <key>
        And the stakeholder chooses to remove the Team Member with name <name>
        And skips confirmation of the removal
        Then the system throws an “Removal is not confirmed” error
        And the Team Member with name <name> is still in the Company Group

    Scenario Outline: (Error Flow) Remove an existing Team Member from the Team Member Profile without confirmation
        When the stakeholder navigates to the profile of the Team Member with name <name>
        And the stakeholder clicks on “Remove from Company” button
        And skips confirmation of the removal
        Then the system throws an “Removal is not confirmed” error
        And the Team Member with name <name> is still in the Company Group