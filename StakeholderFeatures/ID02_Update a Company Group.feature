Feature: ID02_Update a Company Group

    User Stories:
    As a stakeholder
    I want to update the information of an existing company group
    So that information can be updated as needed


    Background:
        Given Given that the stakeholder is logged in
        And that the following Company Group exists:
            

    Scenario Outline: (Normal Flow) Update an Existing Company Group
        When the stakeholder navigates to the settings of the Company Group with name <name> and key <key>
        And changes the name to <name2>
        And clicks the “Save” button
        Then the name of the Company Group is updated to <name2>

        Examples:
            | name | key | Result |
            | Test | TES | Success |

    Scenario Outline: (Error Flow) Update an Existing Company Group to have no name
        When the stakeholder navigates to the settings of the Company Group with name <name> and key <key>
        And deletes the name
        And clicks the “Save” button
        Then the system throws an “Company Group cannot be without a name” error

    Scenario Outline: (Error Flow) Update an Existing Company Group to have no key
        When the stakeholder navigates to the settings of the Company Group with name <name> and key <key>
        And deletes the key
        And clicks the “Save” button
        Then the system throws an “Company Group cannot be without a key” error