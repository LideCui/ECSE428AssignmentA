Feature: ID10_Reject a Project in Preparing Phase

    User Stories:
    As a Stakeholder
    I want to be able to reject a Project in a Preparing Phase
    So that we can decide on which projects we do not want to build

    Background:
        Given that the stakeholder is logged in
        And a Company Group with name <name> and key <key> exists
        And a Preparing phase with name <name>, start date <start date> and end date <end
        date> exists
        And the following projects exist:


    Scenario Outline: (Normal Flow) Reject an existing Project in an existing Preparing phase which is not rejected by the Stakeholder
        When the stakeholder chooses the list of the projects in Preparing phase with name
        <name>
        And the stakeholder rejects the project with name <name>
        Then the project is rejected
        And the number of rejections is increased by one

        Examples:
            | name     | Preparing phase | State    |
            | project1 | Preparing1      | rejected |
            | project2 | Preparing2      | rejected |

    Scenario Outline: (Alternative Flow) Reject an existing Project in an existing Preparing Phase which is approved by the Stakeholder
        When the stakeholder chooses the list of the projects in Preparing phase with name
        <name>
        And the stakeholder rejects the projects with name <name> which was previously
        approved by the stakeholder
        Then the project is rejected
        And the number of rejections is increases by one
        And the number of approvals is decreased by one
