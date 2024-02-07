*** Settings ***
Resource    ../resources/02.ResourceBDD.robot
Suite Setup     Open the browser
Suite Teardown    Close the browser

*** Test Cases ***
Scenario 01: Enroll a student in inexistent a course
    [Documentation]    Accessing the initial Moodle Sandbox page, 
    ...                go to the section "My courses",
    ...                look for a inexistent course
    ...                and the student will not be enrolled in a course.
    [Tags]             student
    Given I am on the initial page in Moodle Sandbox
    When the section "My courses" is accessed
    And I look for a inexistent course
    Then the student can't be enrolled in a inexistent course