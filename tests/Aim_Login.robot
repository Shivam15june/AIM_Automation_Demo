*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***

Valid Login Test
    Open Browser    http://10.10.20.75/login.php    chrome
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    123
    Click Button  id=login
    Sleep    2s
    Page Should Not Contain Element    xpath=//span[contains(@class,"error_message") and contains(text(),"Invalid Credentials")]
    Capture Page Screenshot
    Close Browser

