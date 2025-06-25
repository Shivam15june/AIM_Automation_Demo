*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${CHANNEL_TAB}             xpath=//*[@id="admin_top_nav_bar"]/ul/li[2]/a
${SEARCH_INPUT}            id=filter_c_name

*** Keywords ***

Delete Channel By Name
    [Arguments]    ${CHANNEL_NAME}
    Wait Until Element Is Visible    ${CHANNEL_TAB}    timeout=10s
    Click Element                    ${CHANNEL_TAB}
    Log                              Navigated to Channel Tab

    ${delete_xpath}=    Set Variable    //tr[td[contains(text(), '${CHANNEL_NAME}')]]//a[@class='delete_link tooltip'][img[@alt='Delete channel']]
    Click Element                    xpath=${delete_xpath}
    Sleep                            2s
    Click Element                    id=delete_channel_confirm_link
    Sleep                            2s
    Log                              Clicked Delete icon for channel: ${CHANNEL_NAME}
    Click Element    ${delete_xpath}
    Sleep    5s


Search Channel After Deletion
    [Arguments]    ${CHANNEL_NAME}
    Wait Until Element Is Visible    ${SEARCH_INPUT}    timeout=10s
    Clear Element Text               ${SEARCH_INPUT}
    Input Text                       ${SEARCH_INPUT}    ${CHANNEL_NAME}
    Press Keys                       ${SEARCH_INPUT}    ENTER
      Sleep                            2s
    Log                              Searched for channel: ${CHANNEL_NAME}




