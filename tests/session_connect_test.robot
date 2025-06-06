*** Settings ***
Resource        ../resources/login_keyword.robot
Resource        ../resources/session_file.robot
Suite Setup     Open Browser And Login
Suite Teardown  Close All Browsers

*** Variables ***
${TARGET_MODE}      SHARED

*** Test Cases ***
Connect To Shared Mode Channel
    Show Receivers Section
    Click Channel Connect Icon
    Wait For Channel Modes    ${TARGET_MODE}
    Select Channel Mode       ${TARGET_MODE}
    Confirm Mode Selected
