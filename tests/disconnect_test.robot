*** Settings ***
Library           SeleniumLibrary
Resource    ../resources/login_keyword.robot
Resource    ../resources/disconnect_keyword.robot

Suite Setup       Open Browser And Login
Suite Teardown    Close All Browsers

*** Variables ***
${TARGET_RECEIVER}    Eureka RX    # Change to Decon Rx or Alif RX as needed

*** Test Cases ***
Disconnect Specific Receiver
    Navigate To Receivers Tab
    Disconnect Receiver    ${TARGET_RECEIVER}
