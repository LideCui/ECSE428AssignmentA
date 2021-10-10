Feature: ID28_View policies of a flow system

    User Stories:
    As a team member
    I want to be able to able to view a flow system column's policies
    So that I can correctly create and update different items
    while respecting the rules, to keep the project in order

    Background:
        Given the team member is logged in
        And a page which displays the flow system of a project to which the team member is assigned is open

    Scenario Outline: (Normal Flow) Viewing policies on a column that has policies
        Given the column <Column> has policies <Policies>
        When the team member requests to view policies of the column <Column>
        Then the policies <Policies> should be displayed
        Examples:
            | Column       | Policies                                                             |
            | Acceptance   | For items that are ready for immediate review by a senior programmer |
            | Complete     | For items that are ready to be deployed                              |
            | Pool of idea | Any idea that are worth exploring for the project                    |

    Scenario Outline: (Alternative Flow) Viewing policies on a column that has no policies
        Given the column <Column> has no policies
        When the team member requests to view policies of the column <Column>
        Then the team member receives a message that there are no policies

        Examples:
            | Column       | Polices |
            | Acceptance   |         |
            | Complete     |         |
            | Pool of idea |         |

