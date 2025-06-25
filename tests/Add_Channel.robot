*** Settings ***
Resource    ../resources/login_keyword.robot
Resource    ../resources/Add_Channel.robot

Suite Setup       Open Browser And Login
Suite Teardown    Close All Browserss

*** Test Cases ***
Add Channel Successfully
    [Documentation]    Adds a new channel and validates it appears in the list.
    Navigate To Add Channel Page
    Fill Add Channel Form    Channel_Alif_new9211    Alif TX1 [1]    Alif TX1 [2]    Alif TX1    Alif TX1 [1]
    Save Channel
    Validate Channel Saved    Channel_Alif_new9211


