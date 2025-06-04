*** Settings ***
Resource    ../resources/login_keyword.robot
Resource    ../resources/AddUser.robot

Suite Setup       Open Browser And Login
Suite Teardown    Close All Browserss

*** Test Cases ***
Add New User Successfully
    [Documentation]    Creates a new user with basic fields and saves.
    Navigate To Add User Page
    Fill Add User Form    newuser12345670980    pass@123


