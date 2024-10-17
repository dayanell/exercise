*** Settings ***
Documentation    E2E checkout test for the Automation Exercise website.
Library          SeleniumLibrary
Library          OperatingSystem
Library          Collections
Library          ../customLibraries/Shop.py


# Test Setup and Resources
Test Template    Test Successful Checkout Flow
Resource         resource.robot
Resource         /Users/dayanebahia/aubay/page_object/LandingPage.robot
Resource         /Users/dayanebahia/aubay/page_object/ProductsPage.robot
Resource         /Users/dayanebahia/aubay/page_object/BasePage.robot
Resource         /Users/dayanebahia/aubay/page_object/CartPage.robot
Resource         /Users/dayanebahia/aubay/page_object/LoginPage.robot
Resource         /Users/dayanebahia/aubay/page_object/CheckoutPage.robot
Resource         /Users/dayanebahia/aubay/page_object/PaymentPage.robot
Resource         /Users/dayanebahia/aubay/page_object/PaymentConfirmationPage.robot


*** Test Cases ***
# Product to Search in E2E Checkout Flow
product_type    shirts

*** Keywords ***
# Main Test Flow for Successful Checkout
Test Successful Checkout Flow
    [Arguments]    ${products}

    # Initialize Lists
    ${CART_ADDED_PRODUCTS_LIST} =    Create List
    ${CART_EXPECTED_PRODUCTS_LIST} =    Create List
    ${INDICES} =    Create List

    # Test Steps
    Launch Browser And Navigate To Homepage
    LandingPage.Accept Consent Dialog
    BasePage.Navigate To Products Page
    ProductsPage.Search For Product    ${products}
    Add Products To Cart    ${CART_ADDED_PRODUCTS_LIST}

    # Cart and Checkout Steps
    BasePage.Navigate To Cart Page
    CartPage.Verify Products    ${CART_ADDED_PRODUCTS_LIST}    ${CART_EXPECTED_PRODUCTS_LIST}
    CartPage.Proceed To Checkout Before Login
    LoginPage.Login
    BasePage.Verify Login Success
    BasePage.Navigate To Cart Page
    CartPage.Proceed To Checkout After Login

    # Order Placement and Payment
    CheckoutPage.Place Order
    PaymentPage.Confirm Payment
    PaymentConfirmationPage.Check if your order has been confirmed

    # Cleanup
    [Teardown]    Clear Browser Session













