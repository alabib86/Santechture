*** Settings ***
Resource         ../Utilities/Common.resource     
Resource         ../Pages/LoginPage.resource
Resource         ../Pages/Dashboard.resource 
Resource         ../Pages/NaigationMenu.resource
Resource         ../Pages/AdminUserManagement.resource
Resource         ../Pages/UserManagementAddUser.resource
Test Setup        Common.Initialize Driver
Test Teardown     Common.End Test

*** Test Cases ***
# robot -d Result Suites/TestSuiteOne.robot

Add and delete user
    [Documentation]    This test case adds a user and then deletes it.
    Login with username and password
    Verify Dashboard Page Loaded
    Click on Admin Button
    Verify AdminUserManagement Page Loaded
    ${recordCountBefore}=    Get Record Count
    Write Data To Excel Cell  ${Excel_PATH}  2    2    ${recordCountBefore}    Sheet2
    Navigate to add user form
    Add User details    role=${ROLE}    status=${STATUS}    employeeName=${EMPLOYEE_NAME}    username=${USERNAME_NEW}    password=${PASSWORD}   confirmPassword=${PASSWORD}
    ${recordCountAfter}=    Get Record Count
    Write Data To Excel Cell  ${Excel_PATH}  3     2   ${recordCountAfter}    Sheet2
    ${expression_result}=    Evaluate    ${recordCountBefore} + 1
    Run Keyword And Continue On Failure   Should Be Equal As Integers    ${recordCountAfter}    ${expression_result}
    Search for User By Usrname    ${USERNAME_NEW}
    Delete User    ${USERNAME_NEW}
    Reset Search
    ${recordCountFinal}=    Get Record Count
    Run Keyword And Continue On Failure   Should Be Equal As Integers    ${recordCountBefore}    ${recordCountFinal}
