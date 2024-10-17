*** Settings ***
Documentation    Landing Page - Page Objects and Keywords
Library          SeleniumLibrary
Library          OperatingSystem
Library          Collections
Resource         /Users/dayanebahia/aubay/page_object/BasePage.robot

*** Variables ***
${checkout_button}               css=a.btn.btn-default.check_out
${login_link}                    css=a[href='/login']
${cart_product_name}             xpath=(//td[@class='cart_description']//h4/a)[{index}]
${cart_product_price}            xpath=(//td[@class='cart_price']//p)[{index}]
${wait_time}                     10s

*** Keywords ***
Proceed To Checkout Before Login
    Click Element    css=a.btn.btn-default.check_out
    Wait Until Element Is Visible    css=a[href='/login']    10s
    Execute JavaScript    document.querySelector("a[href='/login']").click()

Proceed To Checkout After Login
    # Proceed to checkout after logging in
    Click Element    ${checkout_button}

Verify Products
    [Arguments]    ${CART_ADDED_PRODUCTS_LIST}    ${CART_EXPECTED_PRODUCTS_LIST}
    ${unique_products} =    Evaluate    set(${CART_ADDED_PRODUCTS_LIST})
    ${product_count} =    Get Length    ${unique_products}

    FOR    ${index}    IN RANGE    0    ${product_count}
        ${product} =    Get Text    ${cart_product_name.replace('{index}', str(${index} + 1))}
        ${price} =    Get Text    ${cart_product_price.replace('{index}', str(${index} + 1))}
        ${product_price} =    Set Variable    ${product}: ${price}
        Append To List    ${CART_EXPECTED_PRODUCTS_LIST}    ${product_price}
    END
    Should Be Equal    ${CART_EXPECTED_PRODUCTS_LIST}    ${CART_ADDED_PRODUCTS_LIST}    Cart values do not match expected
