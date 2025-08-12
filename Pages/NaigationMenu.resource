*** Settings ***
Resource         ../Utilities/Common.resource
*** Variables ***
${adminBtn}            xpath://span[text()='Admin']
*** Keywords ***
Click on Admin Button
    Wait Until Element Is Visible  ${adminBtn}  20s
    Click Element    ${adminBtn}