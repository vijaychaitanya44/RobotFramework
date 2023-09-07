*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Test Teardown       Close Browser
#Resource
*** Variables ***
${error_message}        xpath://div[@class='orangehrm-login-error']/div/div/p


*** Test Cases ***

Validate Successful Login
    open the browser with the Mortgage payment url
    Fill the Login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Firefox
    Go To   https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

Fill the Login form
    Wait Until Element Is Visible  name:username
    Input Text  name:username    Admin
    Wait Until Element Is Visible  name:password
    Input Password    name:password    12345
    Click Button        xpath://button[@type="submit"]

wait until it checks and display error message
    Wait Until Element Is Visible   ${error_message}
verify error message is correct
    ${result}=      Get Text    xpath://div[@class='orangehrm-login-error']/div/div/p
    Should Be Equal As Strings    ${result}    Invalid credentials
    Element Text Should Be  ${error_message}    Invalid credentials
