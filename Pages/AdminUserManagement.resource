*** Settings ***
Resource         ../Utilities/Common.resource

*** Variables ***
${recordCountLabel}       xpath://span[contains(., 'Records Found')]
${addBTN}                 xpath://Button[contains(.,'Add')]
${deleteBTN}              xpath://i[contains(@class,'bi-trash')]
${searchBTN}              xpath://button[contains(.,'Search')]
${sysUsersLabel}           xpath=//h5[contains(.,'System Users')]
${deletePopup}             xpath://div[contains(@class,'orangehrm-dialog-popup')]
${deleteBTNFinal}          xpath://button[contains(.,'Yes,')]
${resetSearchBTN}          xpath=//button[contains(.,'Reset')]
${usernamePHM}              xpath://label[contains(.,'Username')]/following::input[1]

#

*** Keywords ***
Verify AdminUserManagement Page Loaded
    Wait Until Page Contains   User Management   20s

Get Record Count
    Wait Until Element Is Visible   ${recordCountLabel}   20s
    ${recordCountLabel}=    Get Text   ${recordCountLabel}
    ${Count}=  Replace String Using Regexp    ${recordCountLabel}    [^0-9]     ${EMPTY}
    [Return]    ${Count}


Navigate to add user form
    Wait Until Element Is Visible   ${addBTN}   20s
    Click Element    ${addBTN}


Click Search Button
    Wait Until Element Is Enabled   ${searchBTN}   20s
    Click Element    ${searchBTN}

Search for User By Usrname
    [Arguments]    ${username}
    Wait Until Element Is Visible   ${sysUsersLabel}   20s
    Input Text    ${usernamePHM}    ${username}
    Click Search Button
    

Delete User
    [Arguments]    ${username}
    Wait Until Element Is Visible   xpath://div[text()='${username}']   20s
    Click Element    ${deleteBTN}
    Wait Until Element Is Visible  ${deletePopup}   20s
    Click Element    ${deleteBTNFinal}
    Wait Until Page Contains   Successfully Deleted   20s
    Wait Until Page Does Not Contain   Successfully Deleted   20s

Reset Search
    Wait Until Element Is Visible   ${resetSearchBTN}   20s
    Click Element    ${resetSearchBTN}
 