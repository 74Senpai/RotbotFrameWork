*** Settings ***
Documentation     login heroku
Library    SeleniumLibrary

*** Variables ***
${URL}    https://the-internet.herokuapp.com/login
${user_name}    tomsmith
${password}    SuperSecretPassword!


*** Test Cases ***
Login Valid
    Mo trinh duyet
    Truy cap vao trang 
    Dang nhap     ${user_name}    ${password}
    Kiem tra dang nhap

Login Invalid
    Mo trinh duyet
    Truy cap vao trang
    Dang nhap     hehe    huhu
    Kiem tra dang nhap


*** Keywords ***
Mo trinh duyet 
    Open Browser    url=${URL}    browser=chrome

Truy cap vao trang 
    Go To    url=${URL}

Dang nhap
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    id=username    text=${USERNAME}
    Input Password    id=password    password=${PASSWORD}
    Click Button    XPATH=//*[@id="login"]/button

Kiem tra dang nhap 
    Page Should Contain    text=Welcome
    Close Browser




