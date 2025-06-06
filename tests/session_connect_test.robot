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

    ${green_msg_present}=    Is Green Message Present
    ${yellow_msg_present}=   Is Yellow Message Present

    IF    ${green_msg_present}
        # Receiver is not connected, proceed to connect session
        Wait For Channel Modes    ${TARGET_MODE}
        Select Channel Mode       ${TARGET_MODE}
        Confirm Mode Selected
        Sleep    5s
        Verify Disconnect Link Present

    ELSE IF    ${yellow_msg_present}
        # Receiver already connected, fail or log
        Fail Because Session Should Not Connect

    ELSE
        Fail    Unexpected session status message: Neither green nor yellow message found.
    END
