*** Settings ***
Documentation     Login action 
Library    SeleniumLibrary

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${user_name_valid}    Admin
${password_valid}    admin123
${user_name_unvalid}    admin
${password_unvalid}    Admin123
${BROWSER}    chrome

*** Test Cases ***
Login Valid 
    Open Browser Func
    Type a Account    USERNAME=${user_name_valid}    PASSWORD=${password_valid}
    Login Success

Login Unvalid
    Open Browser Func
    Type a Account    USERNAME=${user_name_unvalid}    PASSWORD=${password_unvalid}
    Login Failed

*** Keywords ***
Open Browser Func 
    Open Browser    url=${URL}    browser=${BROWSER}

Type a Account
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Wait Until Page Contains Element    name=username    timeout=5    error=timeout    limit=1
    Input Text    name=username    text=${USERNAME}
    Input Password    name=password    password=${PASSWORD}
    Click Button    XPATH=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

Login Success
    Sleep    2
    Page Should Contain Element   XPATH=//*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[6]/a/span
    Close Browser

Login Failed
    Sleep    2
    Page Should Contain    text=Invalid credentials
    Close Browser
