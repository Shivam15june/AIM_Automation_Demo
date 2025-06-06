*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CONFIRMATION_TEXT}          Receivers
${RECEIVERS_TAB_XPATH}        xpath=//*[@id="admin_top_nav_bar"]/ul/li[3]/a
${RECEIVERS_SECTION_HEADER}   xpath=//h1[contains(text(), "Receivers")]
${CONNECT_ICON_ID}            connect_link_1
${CONNECT_ICON_LOCATOR}       xpath=//span[@id='${CONNECT_ICON_ID}']//a
${DISCONNECT_LINK_ID}         disconnect_link_1

${GREEN_MSG_LOCATOR}          xpath=//div[@class='mb_green message_box' and text()='This receiver is not currently connected.']
${YELLOW_MSG_LOCATOR}         xpath=//div[@class='mb_yellow message_box' and contains(text(), 'This receiver is currently connected to')]

*** Keywords ***
Show Receivers Section
    Click Element    ${RECEIVERS_TAB_XPATH}
    Wait Until Element Is Visible    ${RECEIVERS_SECTION_HEADER}    timeout=5s
    Log    Receiver tab clicked and receiver section is visible

Click Channel Connect Icon
    Wait Until Element Is Visible    id=${CONNECT_ICON_ID}    timeout=10s
    Click Element    ${CONNECT_ICON_LOCATOR}
    Log    Clicked on channel connect icon
    Sleep    5s

Is Green Message Present
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    ${GREEN_MSG_LOCATOR}    timeout=2s
    [Return]    ${present}

Is Yellow Message Present
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    ${YELLOW_MSG_LOCATOR}    timeout=2s
    [Return]    ${present}

Fail Because Session Should Not Connect
    Fail    Session is already connected and should NOT connect again.

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
    Sleep    5s

Confirm Mode Selected
    Page Should Contain    ${CONFIRMATION_TEXT}
    Log    Successfully connected to channel mode

Verify Disconnect Link Present
    Wait Until Element Is Visible    id=${DISCONNECT_LINK_ID}    timeout=10s
    Log    Disconnect link is present, session connected successfully

Get Mode Locator
    [Arguments]    ${MODE_NAME}
    ${locator}=    Set Variable If
    ...    '${MODE_NAME}' == 'SHARED'      xpath=//*[@id="admin_body"]/table/tbody/tr[3]/td[4]/a[1]
    ...    '${MODE_NAME}' == 'PRIVATE'     xpath=//*[@id="admin_body"]/table/tbody/tr[3]/td[4]/a[2]
    ...    '${MODE_NAME}' == 'Exclusive'   xpath=//*[@id="admin_body"]/table/tbody/tr[3]/td[4]/a[3]
    ...    ELSE                            None
    Run Keyword If    '${locator}' == 'None'    Fail    Unsupported session mode: ${MODE_NAME}
    [Return]    ${locator}
