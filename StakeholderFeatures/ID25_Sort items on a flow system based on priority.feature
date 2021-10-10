Feature: ID25_Sort items of a flow system based on priority

    User Stories:
    As a team member
    I want to be able to able to sort the “Proposal Ready” column of a flow system based on priority
    So that I can know which item is more valuable for the stakeholders and adjust my work accordingly

    Background:
        Given the team member is logged in
        And the page of the flow system of a project to which the team member is assigned is open


    Scenario Outline: (Normal Flow) Sorting a “Proposal Ready” column where all items have priority points
        Given the flow system's “Proposal Ready” column contains the items <Items>
        And their priorities are <Priorities>
        When the team member clicks on the “Sort by priority” button of the “Proposal Ready” column
        Then the items are now arranged in the order of <SortedItems>
        Examples:
            | Items                   | Priorities | SortedItems             |
            | item1,item2,item3       | 6,3,8      | item3,item1,item2       |
            | item1,item2,item3,item4 | 6,3,8,2    | item3,item1,item2,item4 |

    Scenario Outline: (Alternative Flow) Sorting a “Proposal Ready” column where some items have equal priority points
        Given the flow system's “Proposal Ready” column contains the items <Items>
        And their priorities are <Priorities>
        When the team member clicks on the “Sort by priority” button of the “Proposal Ready” column
        Then the items are now arranged in the order of <SortedItems>
        Examples:
            | Items                   | Priorities | SortedItems             |
            | item1,item2,item3       | 3,3,7      | item3,item1,item2       |
            | item1,item2,item3,item4 | 2,3,8,2    | item3,item2,item1,item4 |
            | item1,item2             | 2,2        | item1,item2             |
