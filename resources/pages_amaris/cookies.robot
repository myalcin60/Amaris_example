*** Settings ***
Documentation   Refuse all cookies
Library  SeleniumLibrary

*** Variables ***
${cookies_refuser}    id=CybotCookiebotDialogBodyButtonsWrapper

*** Keywords ***
Refuse all cookies
   Wait Until Page Contains Element    ${cookies_refuser}
   Click Element    ${cookies_refuser}