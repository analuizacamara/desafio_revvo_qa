*** Settings ***
Resource    ../resources/02.ResourceBDD.robot
Suite Setup     Open the browser
Suite Teardown    Close the browser

*** Test Cases ***
Scenario 01: Reply a discussion in a forum
    [Documentation]    Accessing the initial Moodle Sandbox page, 
    ...                go to the section "My courses",
    ...                click in the course,
    ...                click a discussion in a forum,
    ...                reply with a message in the discussion
    ...                and the new comment on topic will be add successfully.
    [Tags]             forum
    Given I am on the initial page in Moodle Sandbox
    When the section "My courses" is accessed
    And the existing course page is accessed
    And the forum post page is accessed
    And a reply is add to the forum post
    Then the new comment on topic will be add successfully