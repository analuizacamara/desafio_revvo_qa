*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}              firefox
${URL_MOODLE}           https://sandbox.moodledemo.net/login/index.php
${USERNAME}             xpath=//input[@id='username']
${PASSWORD}             xpath=//input[@id='password']
${LOGIN}                xpath=//button[@id='loginbtn']
${MY_COURSE}            xpath=//a[@role='menuitem'][normalize-space()='My courses']
${COURSE}               xpath=//span[@aria-hidden='true'][normalize-space()='My first course']
${PARTICIPANTS}         xpath=//a[normalize-space()='Participants']
${ENROL_USER}           id=enrolusersbutton-2
${LIST_USERS}           xpath=//span[contains(@class,'form-autocomplete-downarrow position-absolute p-1')]
${USER}                 xpath=(//small[contains(.,'manager@moodle.a')])[2]
${ENROL_USER_BUTTON}    xpath=(//button[normalize-space()='Enrol users'])[1]


*** Keywords ***
#### SETUP
Open the browser
    Open Browser      ${URL_MOODLE}  ${BROWSER}
    
#### GIVEN
I am on the initial page in Moodle Sandbox
    Maximize Browser Window
    Input Text        ${USERNAME}      teacher
    Sleep    1s
    Press Keys        ${USERNAME}    TAB
    Sleep    1s
    Input Text        ${PASSWORD}    sandbox
    Sleep    1s
    Click Button      ${LOGIN}
    Sleep    1s

#### WHEN
The section "My courses" is accessed
    Click Element   ${MY_COURSE}
    Sleep   3s

#### AND
The existing course page is accessed
    Click Element      ${COURSE}
    Sleep    2s

The participants page is accessed
    Click Element      ${PARTICIPANTS}
    Sleep    1s

The student was found to be added to the course
    Click Element      ${ENROL_USER}
    Sleep    3s
    Click Element       ${LIST_USERS}
    Sleep    2s
    Click Element      ${USER}
    Sleep    2s

#### THEN
The student will be enrolled in a course successfully
    Click Button   ${ENROL_USER_BUTTON}
    Sleep   3s

#### TEARDOWN
Close the browser
    Close Browser