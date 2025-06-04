*** Settings ***
Resource    ../resources/login_keyword.robot
Resource    ../resources/Add_Channel.robot

Suite Setup       Open Browser And Login
Suite Teardown    Close All Browserss

*** Test Cases ***
Add Channel Successfully
    [Documentation]    Adds a new channel and validates it appears in the list.
    Navigate To Add Channel Page
    Fill Add Channel Form    Channel_Alif12    Alif TX [1]    Alif TX [2]    Alif TX    Alif TX [1]
    Save Channel
    Validate Channel Saved    Channel_Alif12


