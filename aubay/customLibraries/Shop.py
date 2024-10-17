from random import randint
from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword


"""
@keyword
def add_random_products_to_cart(count, element_count, cart_added_products_list):
  
    # Convert element_count to integer if it’s a string
    element_count = int(element_count) if isinstance(element_count, str) else element_count

    selenium_lib = BuiltIn().get_library_instance("SeleniumLibrary")
    for _ in range(count):
        # Generate a random index within the range
        index = randint(1, element_count)

        # Select and add product to cart
        js_selector = f".features_items .col-sm-4:nth-of-type({index}) .add-to-cart"
        selenium_lib.execute_javascript(f"document.querySelector('{js_selector}').click()")

        # Wait for "Continue Shopping" button and click it
        continue_shopping_button = "//button[contains(text(), 'Continue Shopping')]"
        selenium_lib.wait_until_element_is_visible(continue_shopping_button, timeout="5s")
        selenium_lib.click_element(continue_shopping_button)

        # Capture product name and price
        product_name = get_product_name(index)
        product_price = get_product_price(index)

        # Log and append to list
        BuiltIn().log_to_console(f"Price: {product_price} | Name: {product_name}")
        cart_added_products_list.append(f"{product_name}: {product_price}")

def get_product_price(index):
    
    selenium_lib = BuiltIn().get_library_instance("SeleniumLibrary")
    js_selector = f".features_items .col-sm-4:nth-of-type({index}) .single-products .overlay-content h2"
    price = selenium_lib.execute_javascript(f"return document.querySelector('{js_selector}')?.innerText || 'Price not found'")
    return price

def get_product_name(index):
    
    selenium_lib = BuiltIn().get_library_instance("SeleniumLibrary")
    js_selector = f".features_items .col-sm-4:nth-of-type({index}) .single-products .overlay-content p"
    name = selenium_lib.execute_javascript(f"return document.querySelector('{js_selector}')?.innerText || 'Name not found'")
    return name
"""