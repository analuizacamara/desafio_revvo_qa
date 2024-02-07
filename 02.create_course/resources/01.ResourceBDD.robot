*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}              firefox
${URL_MOODLE}           https://sandbox.moodledemo.net/login/index.php
${USERNAME}             xpath=//input[@id='username']
${PASSWORD}             xpath=//input[@id='password']
${LOGIN}                xpath=//button[@id='loginbtn']
${MY_COURSE}            xpath=//a[contains(@role,'menuitem')][normalize-space()='My courses']
${NEW_COURSE}           xpath=(//button[normalize-space()='Create course'])[1]
${COURSE_NAME}          xpath=//input[@id='id_fullname']
${SHORT_NAME}           xpath=//input[@id='id_shortname']
${SAVE_COURSE}          xpath=(//input[@id='id_saveanddisplay'])[1]


*** Keywords ***
#### SETUP
Open the browser
    Open Browser      ${URL_MOODLE}  ${BROWSER}
    
#### GIVEN
I am on the initial page in Moodle Sandbox
    Maximize Browser Window
    Input Text        ${USERNAME}      manager
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
    Sleep   1s

#### AND
The create course page is accessed
    Click Button      ${NEW_COURSE}
    Sleep    1s

All the required fields is filled in
    Input Text        ${COURSE_NAME}      Revvo Course
    Sleep    1s
    Input Text        ${SHORT_NAME}      Revvo
    Sleep    1s

#### THEN
The new course will be created successfully
    Execute Javascript    window.scrollTo(0,2500)
    Sleep    1s
    Click Button   ${SAVE_COURSE}
    Sleep   3s

#### TEARDOWN
Close the browser
    Close Browser