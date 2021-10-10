Feature: ID03_Delete a Company Croup

    User Stories:
    As a Stakeholder
    I want to be able to delete a你existing Company Group
    So that I can remove any unused Company Groups


    Background:
        Given that the stakeholder is logged in
        And that the following Company Groups exist:


    Scenario Outline: (Normal Flow) Deleting an existing Company Group with confirmation
        When the stakeholder navigates to the settings of the Company Group with name <name> and key <key>
        And the stakeholder clicks on the “Delete” button
        And confirms the delete action
        And clicks on the “Delete Group” button
        Then the Company Group is deleted

        Examples:
            | name | key |  state |
            | Test | TES | deleted |

    Scenario Outline: (Alternative Flow) Deleting an existing Company Group without confirmation
        When the stakeholder navigates to the settings of the Company Group with name <name> and key <key>
        And the stakeholder clicks on the “Delete” button
        And clicks on the “Delete Group” button
        Then the system pops Delete not confirmed window
        And the Company Group is not deleted