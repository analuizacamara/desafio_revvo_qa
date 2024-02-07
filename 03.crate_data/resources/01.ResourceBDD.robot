*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}              firefox
${URL_MOODLE}           https://sandbox.moodledemo.net/login/index.php
${USERNAME}             xpath=//input[@id='username']
${PASSWORD}             xpath=//input[@id='password']
${LOGIN}                xpath=//button[@id='loginbtn']
${SITE_ADM}             xpath=//a[contains(@role,'menuitem')][normalize-space()='Site administration']
${USERS}                xpath=//a[normalize-space()='Users']
${NEW_USER}             xpath=//a[normalize-space()='Add a new user']
${NEW_USERNAME}         xpath=//input[@id='id_username']
${CLEAR_PASSWORD}       xpath=/html/body/div[3]/div[4]/div/div[3]/div/section/div/form/fieldset[1]/div[2]/div[5]/div[2]/span/a[1]/span/span/em
${NEW_PASSWORD}         xpath=//input[@id='id_newpassword']
${FIRST_NAME}           xpath=//input[@id='id_firstname']
${LAST_NAME}            xpath=//input[@id='id_lastname']
${EMAIL}                xpath=//input[@id='id_email']
${CREATE_USER}          xpath=//input[@id='id_submitbutton']
${ADD_NEW_USER}         xpath=(//button[normalize-space()='Add a new user'])[1]


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
The section "Site administration" were accessed
    Click Element   ${SITE_ADM}
    Sleep   1s

#### AND
The section "Users" were accessed
    Click Element      ${USERS}
    Sleep    1s

The create new user page were accessed
    Click Element      ${NEW_USER}
    Sleep    1s

All the required fields were filled in
    FOR    ${i}    IN RANGE    1    11
        Sleep    1s
        Input Text    ${NEW_USERNAME}   estudante${i}
        Click Element   ${CLEAR_PASSWORD}
        Input Text      ${NEW_PASSWORD}     sandbox
        Input Text    ${FIRST_NAME}     Estudante
        Input Text    ${LAST_NAME}      Revvo
        Input Text    ${EMAIL}          revvo${i}@uorak.com
        Sleep    1s
        Execute Javascript    window.scrollTo(0,2500)
        Sleep    1s
        Click Button   ${CREATE_USER}
        Sleep    1s
        Click Button    ${ADD_NEW_USER}
        Log    Created student: Student${i}
    END

#### THEN
The new student will be created successfully
    Sleep   4s

#### TEARDOWN
Close the browser
    Close Browser