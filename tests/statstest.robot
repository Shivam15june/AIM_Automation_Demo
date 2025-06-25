*** Settings ***
Resource    ../resources/login_keyword.robot
Resource    ../resources/stats.robot

Suite Setup       Open Browser And Login
Suite Teardown    Close All Browserss

*** Variables ***
${DEVICE_TO_CLICK}    Eureka RX

*** Test Cases ***
Click Device Stats For Single Device
    [Documentation]    Logs in, navigates to admin menu, and clicks stats icon for one device.
    Click Admin Menu Link
    Click Device Stats Icon    ${DEVICE_TO_CLICK}
