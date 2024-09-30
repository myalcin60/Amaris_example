*** Settings ***
Documentation   Negative test scenario with invalid email for the contact page
Library         SeleniumLibrary
Library         Process
Resource        ../resources/pages_amaris/home_page.robot
Resource        ../resources/pages_amaris/contact_us_page.robot        
*** Comments ***
    robot --include Pozitif test/                      ---> Pour exécuter les tests avec un tag commun
    robot test/TC_02_Logo.robot                        ---> Pour exécuterdes tests dans le terminal
    robot --outputdir results test/contact_us.robot    ---> Pour prendre les rapports dans le dossier de résultat
    robot --outputdir results --include Pozitif test/  ---> Pour prendre les rapports dans le dossier de résultat avec exécuter les tests un tag commun

*** Variables ***
${name}              john
${surname}           Doe
${e_mail}            john@gmail
${your message}      Hello !
${warning_message}   This field is required.
*** Keywords ***
Go to the website Amaris
    Go To URL   
Click on "Contact us"
    Click Link    ${contact us}
On the new page, enter your first name, last name
    Wait Until Element Is Enabled     ${first_name} 
    Input Text    ${first_name}   ${name}
    Input Text    ${last_name}    ${surname}
    
Enter an invalid email address
    Input Text    ${mail}    ${e_mail} 
Under the inquiry section, select "IT"
    Click Element    ${select inquiry}
    Wait Until Element Is Enabled    ${IT}
    Click Element    ${IT}
Choose "Belgium" as the country
    Click Element    ${country}
    Wait Until Element Is Enabled    ${Belgium}
    Click Element    ${Belgium}
Enter your message in the message box
    Input Text    ${message}    ${your message}
Check the "Data Regulation" checkbox to agree to the terms
    Execute Javascript    window.scrollTo(0, 1000)
    Click Element    ${checkbox}
Click the "Send Your Message" button
    Execute Javascript    window.scrollTo(0, 1000)
    Wait Until Element Is Enabled    ${send_button}
    Click Button    ${send_button}
Verify that the message "This field is required." is displayed
    Sleep    2s
    Page Should Contain    ${warning_message} 
   
*** Test Cases ***
Test contact us
    [Tags]  Negatif  Amaris
    Go to the website Amaris
    Click on "Contact us"
    On the new page, enter your first name, last name
    Enter an invalid email address
    Under the inquiry section, select "IT"
    Choose "Belgium" as the country
    Enter your message in the message box
    Check the "Data Regulation" checkbox to agree to the terms
    Click the "Send Your Message" button
    Verify that the message "This field is required." is displayed