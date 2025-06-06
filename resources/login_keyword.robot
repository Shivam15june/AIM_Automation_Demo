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
${LOGOUT_LINK}      xpath=//a[@href="../process_logout.php?admin=1" and text()="Logout"]

*** Keywords ***

Open Browser And Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Enter Login Credentials
    Verify Login Successful
    Validate Logout Link Present
    Capture Page Screenshot

Enter Login Credentials
    Input Text    ${USERNAME_ID}    ${USERNAME}
    Input Text    ${PASSWORD_ID}    ${PASSWORD}
    Click Button  ${LOGIN_BTN_ID}

Verify Login Successful
    Page Should Not Contain    Invalid password
    Log    Logged in successfully

Validate Logout Link Present
    Wait Until Page Contains Element    ${LOGOUT_LINK}    timeout=10s
    Log    Logout link is present on the page

Close All Browserss
    Close Browser



