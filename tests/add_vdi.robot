*** Settings ***
Resource          ../resources/login_keyword.robot
Resource          ../resources/add_vdi.robot
Suite Setup       Open Browser And Login
Suite Teardown    Close All Browsers



*** Variables ***
${VDI_TYPE}       RDP
&{VDI_DATA}       name=rdp909   ip=192.168.20.127    port=80

*** Test Cases ***
Add VDI Based On User Selection And Values
    Navigate To Add VDI Page
    Add Selected VDI Using Given Data    ${VDI_TYPE}    &{VDI_DATA}
