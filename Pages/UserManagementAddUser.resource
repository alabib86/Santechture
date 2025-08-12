*** Settings ***
Resource         ../Utilities/Common.resource

*** Variables ***
${employeeNamePH}          xpath://label[contains(.,'Employee Name')]/following::input[1]
${usernamePH}              xpath://label[contains(.,'Username')]/following::input[1]
${passwordPH}              xpath://label[text()='Password']/following::input[1]
${confirmPasswordPH}      xpath://label[contains(.,'Confirm Password')]/following::input[1]
${saveBTN}                xpath://button[contains(.,'Save')]
${userRoleDDL}            xpath://label[contains(.,'User Role')]/following::div[contains(@class,'oxd-select-text')][1]
${statusDDL}              xpath://label[contains(.,'Status')]/following::div[contains(@class,'oxd-select-text')][1]

*** Keywords ***
Enter User Role
    [Arguments]    ${role}
    Wait Until Element Is Visible   ${userRoleDDL}   20s
    Click Element    ${userRoleDDL}
    IF    $role== 'Admin'
        Press Keys    None    ARROW_DOWN
        Press Keys    None    ENTER
    ELSE IF    $role== 'ESS'
        Press Keys    None    ARROW_DOWN
        Press Keys    None    ARROW_DOWN
        Press Keys    None    ENTER
    END

Enter Status
    [Arguments]    ${Status}
    Wait Until Element Is Visible   ${statusDDL}   20s
    Click Element    ${statusDDL}
    IF    $status== 'Enabled'
        Press Keys    None    ARROW_DOWN
        Press Keys    None    ENTER
    ELSE IF    $status== 'Disabled'
        Press Keys    None    ARROW_DOWN
        Press Keys    None    ARROW_DOWN
        Press Keys    None    ENTER
    END
     
Enter Employee Name
    [Arguments]    ${employeeName}
    Input Text    ${employeeNamePH}    ${employeeName}
    Wait Until Page Contains   ${employeeName}   20s
    Press Keys    None    ARROW_DOWN
    Press Keys    None    ENTER

Enter Username
    [Arguments]    ${username}
    Input Text    ${usernamePH}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    ${passwordPH}    ${password}

Enter Confirm Password
    [Arguments]    ${confirmPassword}
    Input Text    ${confirmPasswordPH}    ${confirmPassword}

Click Save Button
    Wait Until Element Is Enabled   ${saveBTN}   20s
    Click Element    ${saveBTN}
    Wait Until Page Contains   Successfully Saved   20s
    Wait Until Element Is Not Visible   ${saveBTN}   20s

Add User details
    [Arguments]    ${role}    ${status}    ${employeeName}    ${username}    ${password}    ${confirmPassword}
    Enter User Role   ${role}
    Enter Status   ${status}
    Enter Employee Name   ${employeeName}
    Enter Username   ${username}
    Enter Password   ${password}
    Enter Confirm Password   ${confirmPassword}
    Click Save Button