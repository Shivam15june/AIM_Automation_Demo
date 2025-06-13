*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login And Add Channel

    Open Browser    http://192.168.20.1/login.php    chrome
    Maximize Browser Window

    Wait Until Element Is Visible    xpath=//input[@id='username']
    Input Text    xpath=//input[@id='username']    test
    Input Text    xpath=//input[@id='password']    123
    Click Button    id=login
    Wait Until Page Contains Element    xpath=xpath=//*[@id="logout"]/a
    Log    Logged into AIM Web UI

    Click Element    xpath=//a[contains(text(),'Channel')]
    Wait Until Element Is Visible    xpath=//button[text()='Add Channel']
    Click Button    xpath=//button[text()='Add Channel']

    Wait Until Element Is Visible    xpath=//input[@id='channelName']
    Input Text    xpath=//input[@id='channelName']    TestChannel001

    Click Element    xpath=//select[@id='video1']
    Select From List By Label    xpath=//select[@id='video1']    aliftx-1[1]

    Click Button    xpath=//button[text()='Save']
    Wait Until Page Contains    Channel saved successfully
    Log    Channel added successfully

    Close Browser
