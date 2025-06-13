*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${RECEIVERS_TAB_XPATH}        //*[@id="admin_top_nav_bar"]/ul/li[3]/a

*** Keywords ***

Navigate To Receivers Tab
    Click Element    xpath=${RECEIVERS_TAB_XPATH}
    Wait Until Page Contains Element    xpath=//h1[contains(text(), "Receivers")]    timeout=10s
    Log    Navigated to Receivers tab

Disconnect Receiver
    [Arguments]    ${RECEIVER_NAME}
    ${locator}=    Get Disconnect Locator    ${RECEIVER_NAME}
    Wait Until Element Is Visible    xpath=${locator}    timeout=10s
    Click Element    xpath=${locator}
    Log    Clicked disconnect for receiver: ${RECEIVER_NAME}
    Sleep    2s

    ${error_present}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//span[contains(@class, 'error_message') and contains(text(), 'Another user has a current connection')]
    Run Keyword If    ${error_present}    Handle Connection Error

Handle Connection Error
    Log    Error message detected: another user has a current connection, clicking Reset anyway link
    Click Element    xpath=//span[contains(@id, 'error_message')]//a[text()='Reset anyway?']
    Sleep    2s
    Log    Clicked 'Reset anyway?' link to override connection

Get Disconnect Locator
    [Arguments]    ${RECEIVER_NAME}
    Run Keyword If    '${RECEIVER_NAME}' == 'Decon Rx'    Return From Keyword    //tr[td[contains(text(), 'Decon Rx')]]//span[contains(@id, 'disconnect_link')]/a
    Run Keyword If    '${RECEIVER_NAME}' == 'Eureka RX'    Return From Keyword    //tr[td[contains(text(), 'Eureka RX')]]//span[contains(@id, 'disconnect_link')]/a
    Run Keyword If    '${RECEIVER_NAME}' == 'Alif RX'    Return From Keyword    //tr[td[contains(text(), 'Alif RX')]]//span[contains(@id, 'disconnect_link')]/a
    Fail    Unsupported receiver: ${RECEIVER_NAME}
