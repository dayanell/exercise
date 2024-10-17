*** Settings ***
Documentation    Landing Page - Page Objects and Keywords
Library          SeleniumLibrary
Library          OperatingSystem
Library          Collections
Resource         BasePage.robot

*** Variables ***
${consent_button}    xpath=//button[contains(@class, 'fc-primary-button')]
${consent_wait_time}    10s

*** Keywords ***
Accept Consent Dialog
    Wait Until Element Is Visible    ${consent_button}    ${consent_wait_time}
    Click Button    ${consent_button}