*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERS_LINK}           link=USERS
${ADD_USER_LINK}        xpath=//*[@id="admin_body"]/div[2]/a
${NEW_USERNAME_ID}      id=u_username
${PASSWORD2_ID}         id=password
${CONFIRM_PWD_ID}       id=password2
${ADD_CHANNELS_XPATH}   xpath=//*[@id="add_all_channels"]
${SAVE_BUTTON_ID}       id=save_button

*** Keywords ***

Navigate To Add User Page
    Click Link    ${USERS_LINK}
    Wait Until Element Is Visible    ${ADD_USER_LINK}    timeout=10s
    Click Element    ${ADD_USER_LINK}

Fill Add User Form
    [Arguments]    ${new_user1}    ${new_pass}
    Input Text    ${NEW_USERNAME_ID}    ${new_user1}
    Input Text    ${PASSWORD2_ID}       ${new_pass}
    Input Text    ${CONFIRM_PWD_ID}     ${new_pass}
    Click Element    ${ADD_CHANNELS_XPATH}


Save New User Expecting Error
    Wait Until Element Is Visible    ${SAVE_BUTTON_ID}    timeout=10s
    Click Element    ${SAVE_BUTTON_ID}
    # No success wait here, error expected

Save New User
    Wait Until Element Is Visible    ${SAVE_BUTTON_ID}    timeout=10s
    Click Element    ${SAVE_BUTTON_ID}
    Capture Page Screenshot


Verify Error Message Displayed
    [Arguments]    ${error_message}
    Wait Until Page Contains    ${error_message}    timeout=10s
    Log    Verified error message: ${error_message}
    Capture Page Screenshot
