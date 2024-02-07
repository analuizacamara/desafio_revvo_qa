*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}          firefox
${URL_MOODLE}       https://sandbox.moodledemo.net/login/index.php
${USERNAME}         xpath=//input[@id='username']
${PASSWORD}         xpath=//input[@id='password']
${LOGIN}            xpath=//button[@id='loginbtn']


*** Keywords ***
#### SETUP
Open the browser
    Open Browser      ${URL_MOODLE}  ${BROWSER}

#### GIVEN
I am on the register page in Moodle Sandbox
    Maximize Browser Window

#### WHEN
Invalid login username is provided
    Input Text        ${USERNAME}      students
    Sleep    1s
    Press Keys        ${USERNAME}    TAB
    Sleep    1s

#### AND
Invalid password is provided
    Input Text        ${PASSWORD}    sand_box
    Sleep    1s

#### THEN
The accessed to the platform failed
    Click Button    ${LOGIN}
    Sleep    1s

#### TEARDOWN
Close the browser
    Close Browser