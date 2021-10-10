Feature: ID21_View all projects

    User Stories:
    As a team member
    I want to be able to able to view my assigned project's
    So that I can know which project I should contribute to

    Background:
        Given the team member is logged in

    Scenario Outline: (Normal Flow) Viewing assigned projects
        Given the team member is assiged to the projects <AssignedProjects>
        When the team member requests to view his assigned projects
        Then a page should be displayed
        And it contains only the projects whose names are part of <DisplayedProjects>

        Examples:
            | AssignedProjects                         | DisplayedProjects                     |
            | project1, project2                       | project1, project2                    |
            | project1, project3                       | project1, project3                    |
            | project1, project2, project 3, project 4 | project1, project2,project3, project4 |
