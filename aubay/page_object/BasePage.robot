*** Settings ***
Documentation    Landing Page - Page Objects and Keywords
Library          SeleniumLibrary
Library          OperatingSystem
Library          Collections
Resource         /Users/dayanebahia/aubay/tests/resource.robot


*** Variables ***
${products_page_link}              /products
${cart_page_link}                  /view_cart
${login_success_username}          xpath=//div[@class='shop-menu pull-right']//li/a/b
${wait_time}                       10s

*** Keywords ***

Navigate To Products Page
    Click Link    ${products_page_link}

Navigate To Cart Page
    Click Link    ${cart_page_link}

Verify Login Success
    Wait Until Element Is Visible    ${login_success_username}    ${wait_time}
    ${expected_username} =    Evaluate    '${EMAIL}'.split('@')[0]
    ${displayed_username} =    Get Text    ${login_success_username}
    Should Be Equal As Strings    ${displayed_username}    ${expected_username}    The displayed username does not match the expected username
