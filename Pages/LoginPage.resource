*** Settings ***
Resource         ../Utilities/Common.resource

*** Variables ***
${companyLogo}            xpath://img[@alt='company-branding']
${usernamePlaceholder}    xpath://input[@name='username']
${passwordPlaceholder}    xpath://input[@name='password']
${loginBtn}               xpath://button[@type='submit']

*** Keywords ***
Verify Login Page Loaded
    Wait Until Element Is Visible   ${companyLogo}   20s

Enter Username
    Wait Until Element Is Visible   ${usernamePlaceholder}   20s
    Input Text    ${usernamePlaceholder}    ${USERNAME}

Enter Password
    Wait Until Element Is Visible   ${passwordPlaceholder}   20s
    Input Text    ${passwordPlaceholder}    ${PASSWORD}

Click Login
    Wait Until Element Is Enabled   ${loginBtn}   20s
    Click Element    ${loginBtn}

Login with username and password
    Enter Username
    Enter Password
    Click Login
       