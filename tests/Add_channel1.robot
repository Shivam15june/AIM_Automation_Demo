*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Add Channel Successfully
    [Setup]    Open Browser And Login
    Navigate To Add Channel Page
    Fill Add Channel Form
    Save Channel
    Validate Channel Saved
    [Teardown]    Close Browser

*** Keywords ***
Open Browser And Login
    Open Browser    http://10.10.20.75/login.php    chrome
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    123
    Click Button  id=login
    Page Should Not Contain    Invalid Credentials
    Wait Until Page Contains Element    xpath=//a[@href="../process_logout.php?admin=1" and text()="Logout"]    timeout=10s
    Log    Login successful

Navigate To Add Channel Page
    Click Element    xpath=//a[normalize-space(.)='CHANNELS']
    Click Element    xpath=//span[img[@alt='Add channel'] and contains(text(), 'Add Channel')]

Fill Add Channel Form
    Input Text    id=c_name    Channel_Alif_new97

    Select From List By Label     id=video_e_id    Alif TX [1]
    Select From List By Label     id=video1_e_id    Alif TX [2]
    Select From List By Label     id=audio_e_id    Alif TX
    Select From List By Label     id=usb_e_id    Alif TX [1]
    Click Element    xpath=//*[@id="add_all_users"]/img

Save Channel
    Wait Until Element Is Visible    id=save_button    timeout=10s
    Click Element    id=save_button
    Sleep    5s

Validate Channel Saved
    Input Text    id=filter_c_name    Channel_Alif_new97
    Click Element    id=filter_c_name_icon
    Sleep    5s