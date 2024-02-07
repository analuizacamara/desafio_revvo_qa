*** Settings ***
Resource    ../resources/01.ResourceBDD.robot
Suite Setup     Open the browser
Suite Teardown    Close the browser

*** Test Cases ***
Scenario 01: Login with test user successfully
    [Documentation]    Accessing successfully the Moodle Sandbox page, all login fields must be filled in and the user will be access the platform.
    [Tags]             login
    Given I am on the register page in Moodle Sandbox
    When valid login username is provided
    And valid password is provided
    Then I will have successfully accessed the platform