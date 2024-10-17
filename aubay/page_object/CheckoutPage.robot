*** Settings ***
Documentation    Landing Page - Page Objects and Keywords
Library          SeleniumLibrary
Library          OperatingSystem
Library          Collections
Resource         /Users/dayanebahia/aubay/page_object/BasePage.robot

*** Variables ***
${place_order_button}             css=a.btn.btn-default.check_out
${payment_link_js_selector}       a[href='/payment']
${ad_iframe_js_selector}          iframe[id^='aswift']
${name_on_card_field}             css=input[data-qa='name-on-card']
${wait_time}                      10s

*** Keywords ***
Place Order
    Execute JavaScript    document.querySelector("${payment_link_js_selector}").scrollIntoView()
    Run Keyword And Ignore Error    Execute JavaScript    document.querySelector("${ad_iframe_js_selector}").style.display = 'none'
    Wait Until Element Is Visible    ${place_order_button}    ${wait_time}
    Wait Until Element Is Enabled    ${place_order_button}    ${wait_time}
    Click Element    ${place_order_button}
    Wait Until Element Is Visible    ${name_on_card_field}    ${wait_time}