*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Navigate To Add VDI Page
    Click Element    xpath=//*[@id="admin_top_nav_bar"]/ul/li[4]/a
    Wait Until Page Contains Element    xpath=//a[@href="configure_vdi.php"]
    Click Element    xpath=//a[@href="configure_vdi.php"]

Add Selected VDI Using Given Data
    [Arguments]    ${vdi_type}    &{vdi_data}
    Select From List By Label    id=vdi_option_id    ${vdi_type}
    Run Keyword If    '${vdi_type}' == 'RDP'        Fill RDP Details        ${vdi_data['name']}    ${vdi_data['ip']}    ${vdi_data['port']}
    ...    ELSE IF    '${vdi_type}' == 'VNC'        Fill VNC Details        ${vdi_data['name']}    ${vdi_data['ip']}    ${vdi_data['port']}
    ...    ELSE IF    '${vdi_type}' == 'HTML'       Fill HTML Details       ${vdi_data['name']}    ${vdi_data['ip']}    ${vdi_data['port']}
    ...    ELSE IF    '${vdi_type}' == 'Terminal'   Fill Terminal Details   ${vdi_data['name']}    ${vdi_data['ip']}    ${vdi_data['port']}
    ...    ELSE IF    '${vdi_type}' == 'Horizon'    Fill Horizon Details    ${vdi_data['name']}    ${vdi_data['ip']}    ${vdi_data['port']}
    Click Element    id=save_button
    Sleep    3s
    Validate VDI Creation Result    ${vdi_data['name']}
    Log    Successfully added ${vdi_type} VDI with name: ${vdi_data['name']}, IP: ${vdi_data['ip']}, Port: ${vdi_data['port']}

Fill RDP Details
    [Arguments]    ${name}    ${ip}    ${port}
    Input Text    id=r_name    ${name}
    Input Text    id=r_ip      ${ip}
    Input Text    id=r_port    ${port}

Fill VNC Details
    [Arguments]    ${name}    ${ip}    ${port}
    Input Text    id=vnc_name    ${name}
    Input Text    id=vnc_ip      ${ip}
    Input Text    id=vnc_port    ${port}

Fill HTML Details
    [Arguments]    ${name}    ${url}    ${port}
    Input Text    id=h_name    ${name}
    Input Text    id=h_url     ${url}
    Input Text    id=h_port    ${port}

Fill Terminal Details
    [Arguments]    ${name}    ${ip}    ${port}
    Input Text    id=terminal_name    ${name}
    Input Text    id=terminal_ip      ${ip}
    Input Text    id=terminal_port    ${port}

Fill Horizon Details
    [Arguments]    ${name}    ${ip}    ${port}
    Input Text    id=h_name    ${name}
    Input Text    id=h_ip      ${ip}
    Input Text    id=h_port    ${port}

Validate VDI Creation Result
    [Arguments]    ${expected_name}
    ${duplicate_error}=    Run Keyword And Return Status
    ...    Page Should Contain Element    xpath=//span[@class='message_box mb_red']
    Run Keyword If    ${duplicate_error}
    ...    Fail    A device with that IP, Port, service protocol and Domain Name already exists
    Log     VDI "${expected_name}" successfully created.

