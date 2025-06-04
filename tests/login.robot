*** Settings ***
Resource    ../resources/login_keyword.robot
Suite Setup    Open Browser And Login
Suite Teardown    Close All Browserss

*** Test Cases ***
Login With Valid Username And Password
    [Documentation]    Login with test1 and 123
    Log    Login test completed
