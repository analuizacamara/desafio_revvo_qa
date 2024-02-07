*** Settings ***
Resource    ../resources/03.ResourceBDD.robot
Suite Setup     Open the browser
Suite Teardown    Close the browser

*** Test Cases ***
Scenario 01: Logout with test user successfully
    [Documentation]    Accessing successfully the Moodle Sandbox page, all login fields must be filled in, the user will be access
    ...                and the user will do logout the platform.
    [Tags]             logout
    Given I am on the register page in Moodle Sandbox
    When valid access data is provided
    And the access to the platform was successfully
    Then I will do logout in the platform