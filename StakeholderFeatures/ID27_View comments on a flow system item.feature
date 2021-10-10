Feature: ID27_View comments on a flow system item

    User Stories:
    As a team member
    I want to be able to able to view a flow system item's comments
    So that I can receive feedbacks from my team and use them to improve my work

    Background:
        Given the team member is logged in
        And the page of the flow system of a project to which the team member is assigned is open

    Scenario Outline: (Normal Flow) Viewing comments on an item that has comments
        Given the flow system contains an item named <Item>
        And that item has the comments <Comments>
        When the team member clicks the button “View comments” on the item
        Then the comments <Comments> and only them should be displayed

        Examples:
            | Item  | Comments                                                                                        |
            | item1 | good try but it is not completed yet;;;use an array rather not a linked list;;;search on google |
            | item2 | Good implementation;;;I'm glad you are in our team;;;what would we do without you               |
            | item3 | hopefully this makes it to production, great idea;;;I can't wait to implement this              |
            | item4 | this is an interesting idea;;;very unique idea;;;this is particular                             |

    Scenario Outline: (Normal Flow) Viewing comments on an item that does not have comments
        Given the flow system contains an item named <Item>
        And that item has the comments <Comments>
        When the team member clicks the button “View comments” on the item
        Then A message stating there is no comments should be displayed

        Examples:
            | Item  |
            | item1 |
            | item2 |
            | item3 |
            | item4 |
