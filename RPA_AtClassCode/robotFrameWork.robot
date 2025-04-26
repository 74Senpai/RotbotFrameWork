
*** Settings ***
Documentation     Start study with robot
Library    SeleniumLibrary


*** Variables ***
${x}    10
${y}    11



*** Test Cases ***
So sanh hai bien
    Should Be Equal    ${x}    ${y}  

Dieu kien 
    #Condition
    IF    ${x} == ${y}
        Log To Console   hai bien bang nhau
    ELSE
        Log To Console   hai bien khong bang nhau
    END

Loops 
    FOR    ${i}    IN RANGE    10
        Log To Console    ${i}
    END
    
Click element 
    TRY
        Click Element    id=btn-login
    EXCEPT
        Log To Console    bam khong duocs
    END

*** Keywords ***
