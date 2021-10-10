Feature: ID27_Comment on a flow system item

    User Stories:
    As a team member
    I want to be able to able to write comments on a flow system item's comments
    So that I can give feedbacks to my team and help them improve their work

    Background:
        Given the team member is logged in
        And the page of the flow system of a project to which the team member is assigned is open

    Scenario Outline: (Normal Flow) Comments on an item with a correct amount of characters
        Given the flow system contains an item named <Item>
        And that item has the comments <Comments>
        When the team member requests to comment on the item
        And writes a comment <NewComment> less than 2048 characters and more than 0 characters long
        And requests to confirm his action
        Then the item will have the comments <FinalComments>

        Examples:
            | Item  | NewComment  | Comments                            | FinalComments                                     |
            | item1 | that's good | good job;;;+1 here;;;nice;;;not bad | good job;;;+1 here;;;nice;;;not bad;;;that's good |
            | item2 | red         | blue;;;green;;;yellow               | blue;;;green;;;yellow;;;red                       |
            | item3 | hi there    |                                     | hi there                                          |

    Scenario Outline: (Alternative Flow) Comments on an item with a correct amount of characters but quits rather than sending
        Given the flow system contains an item named <Item>
        And that item has the comments <Comments>
        When the team member requests to comment on the item
        And writes a comment <NewComment> less than 2048 characters and more than 0 characters long in the new window
        And requests to abort his action
        Then the item will still only have the comments <Comments>

        Examples:
            | Item  | NewComment  | Comments                            |
            | item1 | that's good | good job;;;+1 here;;;nice;;;not bad |
            | item2 | red         | blue;;;green;;;yellow               |
            | item3 | hi there    |                                     |

    Scenario Outline: (Error Flow) Comments on an item with an incorrect amount of characters
        Given the flow system contains an item named <Item>
        And that item has the comments <Comments>
        When the team member requests to comment on the item
        And writes a comment that is 0 characters in length in the new window
        And requests to confirm his action
        Then the team member receives an error message
        And the item will still only have the comments <Comments>

        Examples:
            | Item  | Comments              |
            | item1 | red;;;blue;;;yellow   |
            | item2 | golf                  |
            | item3 | dance;;;sport;;;study |
            | item4 |                       |

    Scenario Outline: (Error Flow) Comments on an item with an incorrect amount of characters
        Given the flow system contains an item named <Item>
        And that item has the comments <Comments>
        When the team member requests to comment on the item
        And writes a comment that is more than 2048 characters in length in the new window
        And requests to confirm his action
        Then the team member receives an error message
        And the item will still only have the comments <Comments>

        Examples:
            | Item  | Comments              |
            | item1 | red;;;blue;;;yellow   |
            | item2 | golf                  |
            | item3 | dance;;;sport;;;study |
            | item4 |                       |

