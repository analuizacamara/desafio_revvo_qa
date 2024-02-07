*** Settings ***
Resource    ../resources/01.ResourceBDD.robot
Suite Setup     Open the browser
Suite Teardown    Close the browser

*** Test Cases ***
Scenario 01: Enroll a student in a course successfully
    [Documentation]    Accessing the initial Moodle Sandbox page, go to the section "My courses",
    ...                click in the course and next click in participants of the course
    ...                click in "Enrol users",
    ...                find de user to add on course
    ...                add the user
    ...                and the student will be enrolled in a course successfully.
    [Tags]             student
    Given I am on the initial page in Moodle Sandbox
    When the section "My courses" is accessed
    And the existing course page is accessed
    And the participants page is accessed
    And the student was found to be added to the course
    Then the student will be enrolled in a course successfully