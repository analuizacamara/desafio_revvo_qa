*** Settings ***
Resource    ../resources/02.ResourceBDD.robot
Suite Setup     Open the browser
Suite Teardown    Close the browser

*** Test Cases ***
Scenario 01: Login with new user failed
    [Documentation]    Accessing successfully the Moodle Sandbox page, all login fields must be filled with invalid data
    ...                and the user will not be access the platform.
    [Tags]             login
    Given I am on the register page in Moodle Sandbox
    When invalid login username is provided
    And invalid password is provided
    Then the accessed to the platform failed