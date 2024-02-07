*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}          firefox
${URL_MOODLE}       https://sandbox.moodledemo.net/login/index.php
${USERNAME}         xpath=//input[@id='username']
${PASSWORD}         xpath=//input[@id='password']
${LOGIN}            xpath=//button[@id='loginbtn']
${PROFILE}          xpath=//a[@id='user-menu-toggle']
${LOGOUT}           xpath=//a[@role='menuitem'][normalize-space()='Log out']


*** Keywords ***
#### SETUP
Open the browser
    Open Browser      ${URL_MOODLE}  ${BROWSER}
    
#### GIVEN
I am on the register page in Moodle Sandbox
    Maximize Browser Window

#### WHEN
Valid access data is provided
    Input Text        ${USERNAME}      student
    Sleep    1s
    Press Keys        ${USERNAME}    TAB
    Sleep    1s
    Input Text        ${PASSWORD}    sandbox
    Sleep    1s

#### AND
The access to the platform was successfully
    Click Button    ${LOGIN}
    Sleep    1s

#### THEN
I will do logout in the platform
    Click Element   ${PROFILE}
    Sleep   1s
    Click Element    ${LOGOUT}
    Sleep   3s


#### TEARDOWN
Close the browser
    Close Browser