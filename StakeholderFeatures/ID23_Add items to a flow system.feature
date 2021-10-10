Feature: ID23_Add items to a flow system

    User Stories:
    As a team member
    I want to be able to able to add items to a flow system
    With a name
    So that I can share my ideas with other team members

    Background:
        Given the team member is logged in
        And the page of the flow system of a project to which the team member is assigned is open


    Scenario Outline: (Normal Flow) Adding an idea to the flow system with confirmation and name
        Given flow system “Pool of Ideas” column has items with names <Ideas>
        When the team member clicks the button “Add idea”
        And the “add an idea” page is displayed
        And the team member enters an idea with name <NewIdea> which is not part of <Ideas>
        And clicks the “confirm” button
        Then the flow system of the project should only have items with names <IdeasAfter> in its “Pool of Ideas” column
        Examples:
            | Ideas             | NewIdea | IdeasAfter               |
            | idea1,idea2,idea3 | idea44  | idea1,idea2,idea3,idea44 |
            | idea4             | idea55  | idea4,idea55             |
            | idea6             | idea77  | idea6,idea77             |
            | idea8             | idea8   | idea8                    |

    Scenario Outline: (Alternative Flow) Adding an idea to the flow system without confirming
        Given flow system “Pool of Ideas” column has items with names <Ideas>
        When the team member clicks the button “Add idea”
        And the “add an idea” page is displayed
        And the team member enters an idea with name <NewIdea> which is not part of <Ideas>
        And clicks the “quit” button
        Then the flow system of the project should only have items with names <IdeasAfter> in its “Pool of Ideas” column

        Examples:
            | Ideas             | NewIdea | IdeasAfter        |
            | idea1,idea2,idea3 | idea44  | idea1,idea2,idea3 |
            | idea4             | idea55  | idea4             |
            | idea6             | idea77  | idea6             |
            | idea8             | idea8   | idea8             |

    Scenario Outline: (Error Flow) Adding an idea to the flow system which already has an idea of the same name
        Given flow system “Pool of Ideas” column has items with names <Ideas>
        When the team member clicks the button “Add idea”
        And the “add an idea” page is displayed
        And the team member enters an idea with name <NewIdea> which is part of <Ideas>
        And clicks the “confirm” button
        Then the team member should get an error message
        And the flow system of the project should only contain items with names <IdeasAfter>
        And the flow system of the project should have <NbIdea> iems in its “Pool of Ideas” column

        Examples:
            | Ideas             | NewIdea | IdeasAfter        | NbIdea |
            | idea1,idea2,idea3 | idea2   | idea1,idea2,idea3 | 3      |
            | idea4             | idea4   | idea4             | 1      |
            | idea6,idea7       | idea7   | idea6,idea7       | 2      |

    Scenario Outline: (Error Flow) Adding an idea to the flow system without a name
        Given flow system “Pool of Ideas” column has items with names <Ideas>
        When the team member clicks the button “Add idea”
        And the “add an idea” page is displayed
        And the team member clicks the “confirm” button
        Then the team member should get an error message
        And the flow system of the project should only contain items with names <IdeasAfter>
        And the flow system of the project should have <NbIdea> iems in its “Pool of Ideas” column

        Examples:
            | Ideas             | IdeasAfter        | NbIdea |
            | idea1,idea2,idea3 | idea1,idea2,idea3 | 3      |
            | idea4             | idea4             | 1      |
            | idea6,idea7       | idea6,idea7       | 2      |