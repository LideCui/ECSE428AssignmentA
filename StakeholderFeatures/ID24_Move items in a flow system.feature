Feature: ID24_Move items in a flow system

    User Stories:
    As a team member
    I want to be able to able to move items in a flow system
    So that I can expose my work to others and allow the flow system to represent the
    current state of the project accurately

    Background:
        Given the team member is logged in
        And is assigned to at least one project
        And the page of the flow system of one of those projects is open


    Scenario Outline: (Normal Flow) Moving an item in the flow system from one column to another with sufficient permission
        Given the work in progress limit is not reached
        When the team member tries put an item named <ItemName> from <FirstColumnName> to <FinalColumnName>
        And it is <IsTeamLeader> that team member is a team leader
        Then the project's flow system should not have an item named <ItemName> in the column <FirstColumnName>
        And the project's flow system should have an item named <ItemName> in the column <FinalColumnName>

        Examples:
            | IsTeamLeader | ItemName | FirstColumnName     | FinalColumnName     |
            | True         | item1    | Pool of ideas       | Proposals Ongoing   |
            | True         | item2    | Pool of ideas       | Proposal Ready      |
            | True         | item3    | Pool of ideas       | Selected            |
            | True         | item4    | Pool of ideas       | Development Ongoing |
            | True         | item5    | Pool of ideas       | Development Ready   |
            | True         | item6    | Pool of ideas       | Acceptance          |
            | True         | item7    | Pool of ideas       | Complete            |
            | True         | item8    | Proposals Ongoing   | Pool of ideas       |
            | True         | item9    | Proposals Ongoing   | Proposal Ready      |
            | True         | item10   | Proposals Ongoing   | Selected            |
            | True         | item11   | Proposals Ongoing   | Development Ongoing |
            | True         | item12   | Proposals Ongoing   | Development Ready   |
            | True         | item13   | Proposals Ongoing   | Acceptance          |
            | True         | item14   | Proposals Ongoing   | Complete            |
            | True         | item15   | Proposal Ready      | Pool of ideas       |
            | True         | item16   | Proposal Ready      | Proposals Ongoing   |
            | True         | item17   | Proposal Ready      | Selected            |
            | True         | item18   | Proposal Ready      | Development Ongoing |
            | True         | item19   | Proposal Ready      | Development Ready   |
            | True         | item20   | Proposal Ready      | Acceptance          |
            | True         | item21   | Proposal Ready      | Complete            |
            | True         | item22   | Selected            | Pool of ideas       |
            | True         | item23   | Selected            | Proposals Ongoing   |
            | True         | item24   | Selected            | Proposal Ready      |
            | True         | item25   | Selected            | Development Ongoing |
            | True         | item26   | Selected            | Development Ready   |
            | True         | item27   | Selected            | Acceptance          |
            | True         | item28   | Selected            | Complete            |
            | True         | item29   | Development Ongoing | Pool of ideas       |
            | True         | item30   | Development Ongoing | Proposals Ongoing   |
            | True         | item31   | Development Ongoing | Proposal Ready      |
            | True         | item32   | Development Ongoing | Selected            |
            | True         | item33   | Development Ongoing | Development Ready   |
            | True         | item34   | Development Ongoing | Acceptance          |
            | True         | item35   | Development Ongoing | Complete            |
            | True         | item36   | Development Ready   | Pool of ideas       |
            | True         | item37   | Development Ready   | Proposals Ongoing   |
            | True         | item38   | Development Ready   | Proposal Ready      |
            | True         | item39   | Development Ready   | Selected            |
            | True         | item40   | Development Ready   | Development Ongoing |
            | True         | item41   | Development Ready   | Acceptance          |
            | True         | item42   | Development Ready   | Complete            |
            | True         | item43   | Acceptance          | Pool of ideas       |
            | True         | item44   | Acceptance          | Proposals Ongoing   |
            | True         | item45   | Acceptance          | Proposal Ready      |
            | True         | item46   | Acceptance          | Selected            |
            | True         | item47   | Acceptance          | Development Ongoing |
            | True         | item48   | Acceptance          | Development Ready   |
            | True         | item49   | Acceptance          | Complete            |
            | True         | item50   | Complete            | Pool of ideas       |
            | True         | item51   | Complete            | Proposals Ongoing   |
            | True         | item52   | Complete            | Proposal Ready      |
            | True         | item53   | Complete            | Selected            |
            | True         | item54   | Complete            | Development Ongoing |
            | True         | item55   | Complete            | Development Ready   |
            | True         | item56   | Complete            | Acceptance          |
            | False        | item57   | Proposal Ready      | Selected            |
            | False        | item58   | Proposal Ready      | Development Ongoing |
            | False        | item59   | Proposal Ready      | Development Ready   |
            | False        | item60   | Proposal Ready      | Acceptance          |
            | False        | item61   | Selected            | Proposal Ready      |
            | False        | item62   | Selected            | Development Ongoing |
            | False        | item63   | Selected            | Development Ready   |
            | False        | item64   | Selected            | Acceptance          |
            | False        | item65   | Development Ongoing | Proposal Ready      |
            | False        | item66   | Development Ongoing | Selected            |
            | False        | item67   | Development Ongoing | Development Ready   |
            | False        | item68   | Development Ongoing | Acceptance          |
            | False        | item69   | Development Ready   | Proposal Ready      |
            | False        | item70   | Development Ready   | Selected            |
            | False        | item71   | Development Ready   | Development Ongoing |
            | False        | item72   | Development Ready   | Acceptance          |
            | False        | item73   | Acceptance          | Proposal Ready      |
            | False        | item74   | Acceptance          | Selected            |
            | False        | item75   | Acceptance          | Development Ongoing |
            | False        | item76   | Acceptance          | Development Ready   |

    Scenario Outline: (Alternative Flow) Moving an item in the flow system from one column back to it
        When the team member tries to put an item named <ItemName> from <FirstColumnName> but puts it back
        Then the project's flow system should have an item named <ItemName> in the column <FirstColumnName>

        Examples:
            | ItemName | FirstColumnName   |
            | item1    | Acceptance        |
            | item2    | Development Ready |
            | item5    | Complete          |


    Scenario Outline: (Error Flow) Moving an item in the flow system from one column to an incorrect place
        When the team member tries to put an item named <ItemName> from <FirstColumnName> but puts it back
        Then the project's flow system should have an item named <ItemName> in the column <FirstColumnName>
        And the project's flow system should not have an item named <ItemName> in the column <FinalColumnName>
        And the team member should receive an error message

        Examples:
            | ItemName | FirstColumnName   |
            | item1    | Acceptance        |
            | item2    | Development Ready |
            | item3    | Complete          |

    Scenario Outline: (Error Flow) Moving an item into the work in progress section when the limit is already reached
        Given the team member is a team leader
        When the team member tries to put an item <ItemName> which is in column <FirstColumnName>
        which is not in a column of the work in progress section  into a column <FinalColumnName>
        which is part of the work in progress section
        And there are <NbItem> items in the work in progress section
        And the limit of work in progress is <nbItem>
        Then the project's flow system should have an item named <ItemName> in the column <FirstColumnName>
        And the project's flow system should not have an item named <ItemName> in the column <FinalColumnName>
        And the team member should receive an error message

        Examples:
            | NbItem | ItemName | FirstColumnName  | FinalColumnName   |
            | 10     | item1    | Complete         | Acceptance        |
            | 7      | item2    | Pool of ideas    | Development Ready |
            | 50     | item3    | Proposal Ongoing | Selected          |
