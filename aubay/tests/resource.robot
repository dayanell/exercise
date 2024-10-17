*** Settings ***
Documentation    Reusable resources for the Automation Exercise
Library          SeleniumLibrary
Library          OperatingSystem
Library          Collections


*** Variables ***
${CHROME_DRIVER_PATH}    /opt/homebrew/bin/chromedriver
${BASE_URL}              http://automationexercise.com
${EMAIL}                 autexercise@email.com
${PASSWORD}              testpass

*** Keywords ***

Launch Browser And Navigate To Homepage
    Open Browser    ${BASE_URL}    Chrome    executable_path=${CHROME_DRIVER_PATH}
    Maximize Browser Window


Clear Browser Session
    Delete All Cookies
    Execute JavaScript    window.localStorage.clear()
    Execute JavaScript    window.sessionStorage.clear()
    Close Browser


