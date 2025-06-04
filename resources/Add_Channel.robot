*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHANNELS_LINK}         xpath=//a[normalize-space(.)='CHANNELS']
${ADD_CHANNEL_BUTTON}    xpath=//span[img[@alt='Add channel'] and contains(text(), 'Add Channel')]
${CHANNEL_NAME_INPUT}    id=c_name
${VIDEO1_DROPDOWN}       id=video_e_id
${VIDEO2_DROPDOWN}       id=video1_e_id
${AUDIO_DROPDOWN}        id=audio_e_id
${USB_DROPDOWN}          id=usb_e_id
${PERMISSION_ALL_USERS}  xpath=//*[@id="add_all_users"]/img
${SAVE_BUTTON}           id=save_button
${FILTER_CHANNEL_INPUT}  id=filter_c_name
${FILTER_CHANNEL_ICON}   id=filter_c_name_icon


*** Keywords ***
Navigate To Add Channel Page
    Click Element    ${CHANNELS_LINK}
    Click Element    ${ADD_CHANNEL_BUTTON}

Fill Add Channel Form
    [Arguments]    ${channel_name}    ${video1}    ${video2}    ${audio}    ${usb}
    Input Text     id=c_name    ${channel_name}

    Wait Until Element Contains    id=video_e_id    ${video1}    timeout=10s
    Select From List By Label     id=video_e_id    ${video1}

    Wait Until Element Contains    id=video1_e_id    ${video2}    timeout=10s
    Select From List By Label     id=video1_e_id    ${video2}

    Wait Until Element Contains    id=audio_e_id     ${audio}     timeout=10s
    Select From List By Label     id=audio_e_id     ${audio}

    Wait Until Element Contains    id=usb_e_id       ${usb}       timeout=10s
    Select From List By Label     id=usb_e_id       ${usb}

     Wait Until Element Is Visible    ${PERMISSION_ALL_USERS}    timeout=10s
    Click Element    ${PERMISSION_ALL_USERS}


Save Channel
    Wait Until Element Is Visible    ${SAVE_BUTTON}    timeout=10s
    Click Element     ${SAVE_BUTTON}
    Sleep    5s

Validate Channel Saved
    [Arguments]    ${channel_name}
    Input Text    ${FILTER_CHANNEL_INPUT}    ${channel_name}
    Click Element    ${FILTER_CHANNEL_ICON}
     Sleep    5s

