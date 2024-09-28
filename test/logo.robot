*** Settings ***
Documentation   A positive tests for the site logo.
Library         SeleniumLibrary
Library         Process
Resource        ../resources/pages_amaris/home_page.robot

*** Comments ***
    robot --include Pozitif test/                      ---> Pour exécuter les tests avec un tag commun
    robot test/TC_02_Logo.robot                        ---> Pour exécuterdes tests dans le terminal
    robot --outputdir results test/contact_us.robot    ---> Pour prendre les rapports dans le dossier de résultat
    robot --outputdir results --include Pozitif test/  ---> Pour prendre les rapports dans le dossier de résultat avec exécuter les tests un tag commun

*** Variables ***

${EXPECTED_URL}   https://amaris.com/

*** Keywords ***
Go to the website Amaris
    Go To URL    
Open the "Partnerships" page
    Click Element    ${partnersips}
On the new page, click on the AMARIS logo
    Wait Until Element Is Enabled    ${logo}
    Click Element    ${logo} 
Verify that you are redirected back to the homepage
    Wait Until Element Is Visible    ${logo}
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    ${EXPECTED_URL}


*** Test Cases ***
Test logo
    [Tags]  Pozitif
    Go to the website AMARIS
    Open the "Partnerships" page
    On the new page, click on the AMARIS logo
    Verify that you are redirected back to the homepage