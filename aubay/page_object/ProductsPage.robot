*** Settings ***
Documentation    Landing Page - Page Objects and Keywords
Library          SeleniumLibrary
Library          OperatingSystem
Library          Collections
Resource         resource.robot

*** Variables ***
# Element Selectors
${product_search_field}           id:search_product
${submit_search_button}           id:submit_search
${items_list}                     css:.features_items
${single_product_info}            css=.features_items .single-products .productinfo
${continue_shopping_button}       xpath=//button[contains(text(), 'Continue Shopping')]

# JavaScript Selectors
${add_to_cart_js_selector}        .features_items .col-sm-4:nth-of-type({i}) .add-to-cart
${product_price_selector_js}      .features_items .col-sm-4:nth-of-type({i}) .single-products .overlay-content h2
${product_name_selector_js}       .features_items .col-sm-4:nth-of-type({i}) .single-products .overlay-content p

*** Keywords ***
# Product Search and Verification
Search For Product
    [Arguments]    ${products}
    [Documentation]   Searches for a product by name and waits until results are displayed.
    Input Text    ${product_search_field}    ${products}
    Click Button   ${submit_search_button}
    Wait Until Element Is Visible    ${items_list}

Verify Number Of Elements
    [Documentation]   Logs and returns the count of product items visible on the page.
    Element Should Be Visible    ${items_list}
    ${elements} =    Get WebElements    ${single_product_info}
    ${element_count} =    Get Length    ${elements}
    Log To Console    Product element count: ${element_count}
    RETURN   ${element_count}

# Add Random Products to Cart
Add Products To Cart
    [Arguments]    ${CART_ADDED_PRODUCTS_LIST}
    ${element_count} =    Verify Number Of Elements

    FOR   ${n}  IN RANGE    2
        ${i} =    Evaluate    random.randint(1, int(${element_count}))    modules=random
        ${js_selector} =    Set Variable    ${add_to_cart_js_selector.replace('{i}', str(${i}))}
        Execute JavaScript    document.querySelector("${js_selector}").click()

        Wait Until Element Is Visible    ${continue_shopping_button}    5s
        Click Button    ${continue_shopping_button}

        ${price} =    Get Product Price    ${i}
        ${product} =  Get Product Name    ${i}
        ${product_price} =    Set Variable    ${product}: ${price}
        Append To List    ${CART_ADDED_PRODUCTS_LIST}    ${product_price}
    END

# Helper Keywords for Product Details
Get Product Price
    [Arguments]    ${i}
    [Documentation]   Retrieves the price of a product by its index.
    ${js_selector} =    Set Variable    ${product_price_selector_js.replace("{i}", str(${i}))}
    ${price} =    Execute JavaScript    var priceElement = document.querySelector('${js_selector}'); return priceElement ? priceElement.innerText : null
    RETURN   ${price}

Get Product Name
    [Arguments]    ${i}
    [Documentation]   Retrieves the name of a product by its index.
    ${js_selector} =    Set Variable    ${product_name_selector_js.replace("{i}", str(${i}))}
    ${product} =    Execute JavaScript    var productElement = document.querySelector('${js_selector}'); return productElement ? productElement.innerText : null
    RETURN   ${product}
