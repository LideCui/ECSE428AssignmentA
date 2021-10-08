Feature: ID06_Remove Project Leaders from the Company Group

    User Stories:
    As a Stakeholder
    I want to be able to remove Project Leaders from the Company Group
    So that I can keep the Company Group updated with respect to the positional
    changes


    Background:
        Given that the stakeholder is logged in
        And that the Company Group with name <name> and key <key> exists
        And the following Project Leaders exist:
            | name  | email          | role           | company      |
            | test1 | test1@test.com | Project Leader | Test Company |
            | test2 | test2@test.com | Project Leader | Test Company |

    Scenario: (Normal Flow) Remove an existing Project Leader from the Company Group Settings
        When the stakeholder navigates to the settings of the Company Group with name <name> and key <key>
        And the stakeholder chooses to remove the Project Leader with name <name>
        And confirms the removal
        Then the Project Leader with name <name> is removed from the Company Group

    Scenario: (Alternative Flow) Remove an existing Project Leader from the Project Leader Profile
        When the stakeholder navigates to the profile of the Project Leader with name <name>
        And the stakeholder clicks on “Remove from Company” button
        And confirms the removal
        Then the Project Leader with name <name> is removed from the Company Group

    Scenario: (Error Flow) Remove an existing Project Leader from the Company Group Settings without confirmation
        When the stakeholder navigates to the settings of the Company Group with name <name> and key <key>
        And the stakeholder chooses to remove the Project Leader with name <name>
        And skips confirmation of the removal
        Then the system throws an “Removal is not confirmed” error
        And the Project Leader with name <name> is still in the Company Group

    Scenario Outline: (Error Flow) Remove an existing Project Leader from the Project Leader Profile without confirmation
        When the stakeholder navigates to the profile of the Project Leader with name <name>
        And the stakeholder clicks on “Remove from Company” button
        And skips confirmation of the removal
        Then the system throws an “Removal is not confirmed” error
        And the Project Leader with name <name> is still in the Company Group