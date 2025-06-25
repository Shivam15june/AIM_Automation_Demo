*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${ADMIN_MENU_LINK}  xpath=//*[@id="admin_top_nav_bar"]/ul/li[9]/a

*** Keywords ***

Bypass SSL Warning
    ${advanced_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    id=details-button    timeout=5s
    Run Keyword If    ${advanced_visible}    Click Element    id=details-button

    ${proceed_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    id=proceed-link    timeout=5s
    Run Keyword If    ${proceed_visible}    Click Element    id=proceed-link

    Log    SSL warning bypass attempted (if present)

Click Admin Menu Link
    Wait Until Element Is Visible    ${ADMIN_MENU_LINK}    timeout=15s
    Click Element    ${ADMIN_MENU_LINK}
    Log    Clicked Admin menu link

Click Device Stats Icon
    [Arguments]    ${device_name}
    Log    Attempting to click stats icon for device: ${device_name}

    ${norm_device_name}=    Convert To Lowercase    ${device_name}
    Log    Normalized device name for matching: ${norm_device_name}

    ${row_xpath}=    Set Variable
    ...    //td[contains(@class,'device_name') and contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '${norm_device_name}')]/parent::tr
    Log    Using XPath: ${row_xpath}

    Wait Until Element Is Visible    xpath=${row_xpath}    timeout=20s
    Log    Found device row for: ${device_name}

    ${stats_link_xpath}=    Set Variable    ${row_xpath}//a[contains(@href,'updateStatsRow')]
    Wait Until Element Is Visible    xpath=${stats_link_xpath}    timeout=15s
    Log    Found stats icon link xpath: ${stats_link_xpath}

    ${stats_link_id}=    Get Element Attribute    xpath=${stats_link_xpath}    id
    Log    Stats link ID: ${stats_link_id}

    ${device_id}=    Replace String    ${stats_link_id}    statsA_    ${EMPTY}
    Log    Extracted device ID: ${device_id}

    Click Element    xpath=${stats_link_xpath}
    Log    Clicked stats enable icon for device ${device_name}

    ${stats_page_link_id}=    Set Variable    link_${device_id}
    Wait Until Element Is Visible    id=${stats_page_link_id}    timeout=20s
    Log    Found stats page link with id: ${stats_page_link_id}

    Click Element    id=${stats_page_link_id}
    Sleep    15s
    Log    Clicked stats page link for device ${device_name}

    # Attempt SSL warning bypass after clicking stats page
    Run Keyword And Ignore Error    Bypass SSL Warning

Close All Browsers
    Close All Browsers
