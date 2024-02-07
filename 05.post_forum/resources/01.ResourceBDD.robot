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
${NEWS_FORUM}           xpath=//a[contains(@class,' aalink stretched-link')]
${ADD_DISCUSSION}       xpath=//a[normalize-space()='Add discussion topic']
${SUBJECT}              xpath=//input[@id='id_subject']
${FRAME}                xpath=//iframe[@id='id_message_ifr']
${MESSAGE}              xpath=(//body)[1]
${POST_FORUM}           xpath=(//div[@id='yui_3_18_1_1_1707262209228_56'])[1]


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

The forum new post page is accessed
    Click Element      ${NEWS_FORUM}
    Sleep    1s
    Click Element      ${ADD_DISCUSSION}
    Sleep    2s

All the required fields is filled in
    Input Text        ${SUBJECT}      New forum
    Sleep    2s
    Press Keys        ${SUBJECT}      TAB
    Sleep    1s
    Select Frame      ${FRAME}
    Input Text        ${MESSAGE}      Novo post no fórum.
    Sleep    2s
    Press Keys        ${MESSAGE}    TAB
    Sleep    2s

#### THEN
The new forum post will be add successfully
    Click Element   ${POST_FORUM}
    Sleep   3s

#### TEARDOWN
Close the browser
    Close Browser