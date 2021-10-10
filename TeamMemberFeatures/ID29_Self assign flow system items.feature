Feature: ID29_Self assign flow system items

    User Stories:
    As a team member
    I want to be able to assign to myself items in the “Selected” column
    So that I can let my team knows that I am in charge of that item, to prevent duplicate work


    Background:
        Given the team member is logged in
        And is assigned to at least one project
        And a page which displays the flow system of one of those projects is open


    Scenario Outline: (Normal Flow) Assigning to oneself an item in the selected section without exceeding personal WIP amount
        Given the team member is named <Name>
        And the item with name <ItemName> is in the “Selected” column of the flow system
        And the item with name <ItemName> has no current assignee
        And the team member has a personal work in progress limit of <PersLimit>
        And the team member has a current work in progress of <CurWIP>
        When the team member requests to self assign the item
        Then The item shall have an assignee with the name <Name>
        Examples:
            | Name    | ItemName | PersLimit | CurWIP |
            | Jake    | item1    | 10        | 1      |
            | Sarah   | item2    | 12        | 5      |
            | Gustave | item3    | 3         | 1      |


    Scenario Outline: (Error Flow) Assigning to oneself an item not the selected section without exceeding personal WIP amount
        Given the team member is named <Name>
        And the item with name <ItemName> is in the <Column> column of the flow system
        And the team member has a personal work in progress limit of <PersLimit>
        And the team member has a current work in progress of <CurWIP>
        When the team member requests to self assign the item
        Then The team member with name <Name> shall receive an error message
        Examples:
            | Name    | ItemName | PersLimit | CurWIP | Column       |
            | Jake    | item1    | 10        | 1      | Acceptance   |
            | Sarah   | item2    | 12        | 5      | Complete     |
            | Gustave | item3    | 3         | 1      | Pool of idea |

    Scenario Outline: (Error Flow) Assigning to oneself an item in the selected section with full personal WIP amount
        Given the team member is named <Name>
        And the item with name <ItemName> is in the “Selected” column of the flow system
        And the item with name <ItemName> has no current assignee
        And the team member has a personal work in progress limit of <PersLimit>
        And the team member has a current work in progress of <CurWIP>
        When the team member requests to self assign the item
        Then The team member with name <Name> shall receive an error message
        Examples:
            | Name    | ItemName | PersLimit | CurWIP |
            | Jake    | item1    | 10        | 10     |
            | Sarah   | item2    | 12        | 12     |
            | Gustave | item3    | 3         | 3      |
