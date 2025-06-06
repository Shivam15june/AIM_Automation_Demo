*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CONFIRMATION_TEXT}          Receivers
${RECEIVERS_TAB_XPATH}        xpath=//*[@id="admin_top_nav_bar"]/ul/li[3]/a
${RECEIVERS_SECTION_HEADER}   xpath=//h1[contains(text(), "Receivers")]
${CONNECT_ICON_ID}            connect_link_1
${CONNECT_ICON_LOCATOR}       xpath=//span[@id='${CONNECT_ICON_ID}']//a

*** Keywords ***
Show Receivers Section
    Click Element    ${RECEIVERS_TAB_XPATH}
    Wait Until Element Is Visible    ${RECEIVERS_SECTION_HEADER}    timeout=5s
    Log    Receiver tab clicked and receiver section is visible

Click Channel Connect Icon
    Wait Until Element Is Visible    id=${CONNECT_ICON_ID}    timeout=10s
    Click Element    ${CONNECT_ICON_LOCATOR}
    Log    Clicked on channel connect icon

Wait For Channel Modes
    [Arguments]    ${MODE_NAME}
    ${locator}=    Get Mode Locator    ${MODE_NAME}
    Wait Until Page Contains Element    ${locator}    timeout=10s
    Log    Channel modes loaded for mode: ${MODE_NAME}

Select Channel Mode
    [Arguments]    ${MODE_NAME}
    ${locator}=    Get Mode Locator    ${MODE_NAME}
    Click Element    ${locator}
    Log    Selected channel mode: ${MODE_NAME}

Confirm Mode Selected
    Page Should Contain    ${CONFIRMATION_TEXT}
    Log    Successfully connected to channel mode

Get Mode Locator
    [Arguments]    ${MODE_NAME}
    ${locator}=    Set Variable If
    ...    '${MODE_NAME}' == 'SHARED'      xpath=//*[@id="admin_body"]/table/tbody/tr[3]/td[4]/a[1]
    ...    '${MODE_NAME}' == 'PRIVATE'     xpath=//*[@id="admin_body"]/table/tbody/tr[3]/td[4]/a[2]
    ...    '${MODE_NAME}' == 'Exclusive'   xpath=//*[@id="admin_body"]/table/tbody/tr[3]/td[4]/a[3]
    ...    ELSE                            None
    Run Keyword If    '${locator}' == 'None'    Fail    Unsupported session mode: ${MODE_NAME}
    [Return]    ${locator}


