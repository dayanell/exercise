*** Settings ***
Documentation    Landing Page - Page Objects and Keywords
Library          SeleniumLibrary
Library          OperatingSystem
Library          Collections
Resource         /Users/dayanebahia/aubay/page_object/BasePage.robot

*** Variables ***
${login_email_field}           css=input[data-qa="login-email"]
${login_password_field}        css=input[data-qa="login-password"]
${login_button}                css=button[data-qa="login-button"]
${user_email}                  autexercise@email.com
${user_password}               testpass

*** Keywords ***
Login
    Input Text    ${login_email_field}     ${user_email}
    Input Text    ${login_password_field}  ${user_password}
    Click Button    ${login_button} 

