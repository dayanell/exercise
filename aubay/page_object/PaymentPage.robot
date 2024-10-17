*** Settings ***
Documentation    Landing Page - Page Objects and Keywords
Library          SeleniumLibrary
Library          OperatingSystem
Library          Collections



*** Variables ***
${card_name_input}           input[data-qa='name-on-card']
${card_number_input}         input[data-qa='card-number']
${cvc_input}                 input[data-qa='cvc']
${expiry_month_input}        input[data-qa='expiry-month']
${expiry_year_input}         input[data-qa='expiry-year']
${submit_button}             id=submit
${card_name}                 Dayane Lima
${card_number}               5123456879516523
${cvc}                       311
${expiry_month}              01
${expiry_year}               2031

*** Keywords ***

Confirm Payment
    Execute JavaScript    document.querySelector("${card_name_input}").value = '${card_name}';
    Execute JavaScript    document.querySelector("${card_number_input}").value = '${card_number}';
    Execute JavaScript    document.querySelector("${cvc_input}").value = '${cvc}';
    Execute JavaScript    document.querySelector("${expiry_month_input}").value = '${expiry_month}';
    Execute JavaScript    document.querySelector("${expiry_year_input}").value = '${expiry_year}';
    Click Element    ${submit_button}