*** Settings ***
Resource    ../resources/01.ResourceBDD.robot
Suite Setup     Open the browser
Suite Teardown    Close the browser

*** Test Cases ***
Scenario 01: Add a new topic in a forum
    [Documentation]    Accessing the initial Moodle Sandbox page, 
    ...                go to the section "My courses",
    ...                click in the course,
    ...                click in "News forum",
    ...                add a discussion topic filling in the subject and the message
    ...                post the message in the forum
    ...                and the new forum topic will be add successfully.
    [Tags]             forum
    Given I am on the initial page in Moodle Sandbox
    When the section "My courses" is accessed
    And the existing course page is accessed
    And the forum new post page is accessed
    And all the required fields is filled in
    Then the new forum post will be add successfully