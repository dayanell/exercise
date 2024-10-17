*** Settings ***
Documentation    Landing Page - Page Objects and Keywords
Library          SeleniumLibrary
Library          OperatingSystem
Library          Collections
Resource         /Users/dayanebahia/aubay/page_object/BasePage.robot

*** Variables ***
${order_confirmed_message_xpath}    xpath=//h2[@data-qa='order-placed']//b
${expected_success_message}         ORDER PLACED!

*** Keywords ***
Check if your order has been confirmed
    Wait Until Element Is Visible    ${order_confirmed_message_xpath}    5s
    ${success_message} =    Get Text    ${order_confirmed_message_xpath}
    Should Be Equal As Strings    ${success_message}    ${expected_success_message}
