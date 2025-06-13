*** Settings ***
Library           SeleniumLibrary
Resource    ../resources/login_keyword.robot
Resource    ../resources/archieve.robot


Suite Setup       Open Browser And Login
Suite Teardown    Close All Browsers

*** Test Cases ***
Archive And Download Logs
    Archive Log