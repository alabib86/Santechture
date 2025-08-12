*** Settings ***
Library          SeleniumLibrary
Library          String
Resource         ../Data/Variables.resource
Resource         ./ExcellHandler.resource


*** Keywords ***

Get URL
    ${cell_data} =  Get Cell Data From Excell    ${Excel_PATH}   2    2    Sheet1
    Set Global Variable    ${URL}    ${cell_data}
    
Get Username
    ${cell_data} =  Get Cell Data From Excell    ${Excel_PATH}   3    2    Sheet1
    Set Global Variable    ${USERNAME}    ${cell_data}

Get Password
    ${cell_data} =  Get Cell Data From Excell    ${Excel_PATH}   4    2    Sheet1
    Set Global Variable    ${PASSWORD}    ${cell_data}

Get Browser
    ${cell_data} =  Get Cell Data From Excell    ${Excel_PATH}   5    2    Sheet1
    Set Global Variable    ${BROWSER}    ${cell_data}
Get Role
    ${cell_data} =  Get Cell Data From Excell    ${Excel_PATH}   6    2    Sheet1
    Set Global Variable    ${ROLE}    ${cell_data}
Get Status
    ${cell_data} =  Get Cell Data From Excell    ${Excel_PATH}   7    2    Sheet1
    Set Global Variable    ${STATUS}    ${cell_data}
Get Employee Name
    ${cell_data} =  Get Cell Data From Excell    ${Excel_PATH}   8    2    Sheet1
    Set Global Variable    ${EMPLOYEE_NAME}    ${cell_data}
Get Username For new user
    ${cell_data} =  Get Cell Data From Excell    ${Excel_PATH}   9    2    Sheet1
    Set Global Variable    ${USERNAME_NEW}    ${cell_data}

Set All Variables
    Get URL
    Get Username
    Get Password
    Get Browser
    Get Role
    Get Status
    Get Employee Name
    Get Username For new user

Initialize Driver
    Set All Variables
    set selenium speed      .1s
    set selenium timeout    20s
    open browser        ${URL}      ${BROWSER}
    maximize browser window

End Test
    close all browsers