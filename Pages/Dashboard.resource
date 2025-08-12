*** Settings ***
Resource         ../Utilities/Common.resource


*** Variables ***


*** Keywords ***
Verify Dashboard Page Loaded
    Wait Until Page Contains   Dashboard   20s

