*** Settings ***
Resource    ../resources/01.ResourceBDD.robot
Suite Setup     Open the browser
Suite Teardown    Close the browser

*** Test Cases ***
Scenario 01: Create a new course successfully
    [Documentation]    Accessing the initial Moodle Sandbox page, go to the section "My courses",
    ...                click in "Create course", all fields must be filled in 
    ...                and the new course will be created successfully.
    [Tags]             course
    Given I am on the initial page in Moodle Sandbox
    When the section "My courses" is accessed
    And the create course page is accessed
    And all the required fields is filled in
    Then the new course will be created successfully
    