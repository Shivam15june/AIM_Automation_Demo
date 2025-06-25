*** Settings ***
Resource    ../resources/login_keyword.robot
Resource    ../resources/channel_del.robot

Suite Setup       Open Browser And Login
Suite Teardown    Close All Browserss

*** Test Cases ***
Delete And Search Channel
    [Documentation]    Deletes the given channel and searches it to confirm
    Delete Channel By Name          Channel_Alif_new93
    Search Channel After Deletion   Channel_Alif_new93