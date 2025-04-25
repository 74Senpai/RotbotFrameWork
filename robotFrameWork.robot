
*** Settings ***
Documentation     Start study with robot


*** Variables ***
${x}    10
${y}    10


*** Test Cases ***
So sanh hai bien
    Should Be Equal    ${x}    ${y}  

*** Keywords ***

