Feature: ID09_Approve a Project in Preparing Phase

    User Stories:
    As a stakeholder
    I want to be able to approve a Project in a Preparing phase
    So that we can choose which projects will be built and released


    Background:
        Given that the stakeholder is logged in
        And a Company Group with name <name> and key <key> exists
        And a Preparing phase with name <name>, start date <start date> and end date <end
        date> exists
        And the following projects exist:
            | name     | Preparing phase |
            | project1 | Preparing1      |
            | project2 | Preparing2      |

    Scenario Outline: (Normal Flow) Approve an existing Project in an existing Preparing phase which is not approved by the Stakeholder
        When the stakeholder chooses the list of the projects in Preparing phase with name <name>
        And the stakeholder approves the project with name <name>
        Then the project is approved
        And the number of approvals is increased by one

    Scenario Outline: (Alternative Flow) Approve an existing Project in an existing Preparing Phase which is rejected by the Stakeholder
        When the stakeholder chooses the list of the projects in Preparing phase with name <name>
        And the stakeholder approves the projects with name <name> which was previously rejected by the stakeholder
        Then the project is approved
        And the number of approvals is increases by one
        And the number of rejections is decreased by one