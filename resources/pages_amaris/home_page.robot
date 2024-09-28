*** Settings ***
Library  SeleniumLibrary
Resource  cookies.robot

*** Variables ***
${URL}        https://amaris.com/
${Browser}    chrome

${logo}           xpath=//a[@class='navbar-brand']
${partnersips}    xpath=//a[@title='Partnerships']
${contact us}     id=contact

*** Keywords ***
Go To URL
    Open Browser  ${URL}  ${Browser} 
    Maximize Browser Window
    Refuse all cookies
    