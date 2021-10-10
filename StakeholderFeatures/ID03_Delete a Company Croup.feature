Feature: ID03_Delete a Company Croup

    User Stories:
    As a Stakeholder
    I want to be able to delete an existing Company Group
    So that I can remove any unused Company Groups


    Background:
        Given that the stakeholder is logged in
        And that the following Company Groups exist:


    Scenario Outline: (Normal Flow) Deleting an existing Company Group with confirmation
        When the stakeholder navigates to the settings of the Company Group with name <name> and key <key>
        And the stakeholder delete the group
        And the stakeholde confirms deletion of the group
        Then the Company Group is deleted

        Examples:
            | name | key |  state |
            | Test | TES | deleted |

    Scenario Outline: (Alternative Flow) Deleting an existing Company Group without confirmation
        When the stakeholder navigates to the settings of the Company Group with name <name> and key <key>
        And the stakeholder delete the group
        And the stakeholde does not confirm deletion of the group
        Then the system pops Delete not confirmed window
        And the Company Group is not deleted