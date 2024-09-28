*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${first_name}    id=form-field-name
${last_name}     id=form-field-forname
${mail}          id=form-field-email
${select inquiry}  id=form-field-inquiry
${country}        id=form-field-country
${IT}            xpath=//select[@name='form_fields[inquiry]']/option[@value='IT']
${Belgium}       xpath=//select[@name='form_fields[country]']/option[@value='Belgium']
${message}       id=form-field-message
${send_button}   id=ama-contact-apply
${checkbox}      id=form-field-optin
