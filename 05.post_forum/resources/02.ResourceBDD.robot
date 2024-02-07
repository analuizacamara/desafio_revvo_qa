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
${POST}                 xpath=//a[normalize-space()='New forum']
${REPLY}                xpath=//a[normalize-space()='Reply']
${MESSAGE}              xpath=/html/body/div[2]/div[4]/div/div[3]/div/section/div[2]/div/article/div[1]/div/div[2]/div/form/div[1]/span/textarea
${POST_FORUM}           xpath=//span[@data-region='submit-text']

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

The forum post page is accessed
    Click Element      ${NEWS_FORUM}
    Sleep    1s
    Click Element      ${POST}
    Sleep    2s

A reply is add to the forum post
    Click Element        ${REPLY}
    Sleep    2s
    Click Element     ${MESSAGE}  
    Input Text        ${MESSAGE}      Nova resposta no fórum.
    Sleep    2s

#### THEN
The new comment on topic will be add successfully
    Click Element   ${POST_FORUM}
    Sleep   3s

#### TEARDOWN
Close the browser
    Close Browser