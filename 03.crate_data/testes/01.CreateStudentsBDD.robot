*** Settings ***
Resource    ../resources/01.ResourceBDD.robot
Suite Setup     Open the browser
Suite Teardown    Close the browser

*** Test Cases ***
Scenario 01: Create 10 students on Moodle Sandbox
    [Documentation]    Accessing the initial Moodle Sandbox page, go to the section "Site administration",
    ...                click in "Users" to add a new user, 
    ...                all fields must be filled in 
    ...                and the new student will be created successfully.
    [Tags]             students
    Given I am on the initial page in Moodle Sandbox
    When the section "Site administration" were accessed
    And the section "Users" were accessed
    And the create new user page were accessed
    And all the required fields were filled in
    Then the new student will be created successfully