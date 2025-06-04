*** Settings ***
Resource    ../resources/login_keyword.robot
Resource    ../resources/AddUser.robot

Suite Setup       Open Browser And Login
Suite Teardown    Close All Browserss

*** Test Cases ***

Add New User With Empty Username Should Fail
    [Documentation]    Verify that leaving username empty triggers error message.
    Navigate To Add User Page
    Fill Add User Form    ${EMPTY}    pass@123
    Save New User Expecting Error
    Verify Error Message Displayed    Please ensure that you have completed the form correctly
