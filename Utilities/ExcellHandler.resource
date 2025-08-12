*** Settings ***
Library          ExcelLibrary


*** Keywords ***

Get Cell Data From Excell
     [Arguments]    ${FilePath}     ${Row_No}    ${Column-No}    ${SheetName}
     open excel document      ${FilePath}       1
     ${Cell_Data}  excellibrary.read excel cell    ${Row_No}    ${Column-No}    ${SheetName}
     [Return]     ${Cell_Data}
     close all excel documents


Write Data To Excel Cell
    [Arguments]    ${FilePath}    ${Row_No}    ${Column_No}    ${Value}    ${SheetName}
    Open Excel Document    ${FilePath}    1    
    Write Excel Cell    ${Row_No}    ${Column_No}    ${Value}    ${SheetName}
    Save Excel Document    ${FilePath}  
    Close All Excel Documents