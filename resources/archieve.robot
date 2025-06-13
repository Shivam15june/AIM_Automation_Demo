*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Archive Log
    Click Element    xpath=//a[img[contains(@src, 'database_save.png')] and contains(text(), 'Backups')]
    Select From List By Index    id=log_type    0
    Click Element    xpath=//span[img[contains(@src, 'database_table.png')] and contains(text(), 'Archive')]
    Reload Page
    Sleep    5s
    ${options}=    Get List Items    id=log_type
    ${last_index}=    Evaluate    len(${options}) - 1
    Select From List By Index    id=log_type    ${last_index}
    Click Element    xpath=//span[img[contains(@src, 'database_save.png')] and contains(text(), 'Download')]
    Sleep    5s
    Log    Archive log process completed successfully
