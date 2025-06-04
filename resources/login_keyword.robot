*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}              http://192.168.20.1/login.php
${BROWSER}          chrome
${USERNAME_ID}      id=username
${PASSWORD_ID}      id=password
${LOGIN_BTN_ID}     id=login
${USERNAME}         test1
${PASSWORD}         123
${USERS_LINK}       link=USERS
${SAVE_BUTTON}      partial link text=Save

*** Keywords ***

Open Browser And Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Enter Login Credentials
    Verify Login Successful
    Capture Page Screenshot

Enter Login Credentials
    Input Text    ${USERNAME_ID}    ${USERNAME}
    Input Text    ${PASSWORD_ID}    ${PASSWORD}
    Click Button  ${LOGIN_BTN_ID}

Verify Login Successful
    Wait Until Page Contains Element    ${USERS_LINK}    timeout=10s
    Page Should Not Contain    Invalid password
    Log    Logged in successfully

Close All Browserss
    Close Browser