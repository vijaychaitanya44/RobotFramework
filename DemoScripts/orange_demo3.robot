*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Test Setup      open the browser with the Mortgage payment url
Test Teardown       close browser session
Resource        orange_resource.robot


*** Variables ***
${error_message}        xpath://div[@class='orangehrm-login-error']/div/div/p
${dashboard_text}       xpath://h6[text()='Dashboard']


*** Test Cases ***

Validate Successful Login

    Fill the Login form         ${username}     ${invalid_password}
    wait until element is located in the page       ${error_message}
    verify error message is correct


Validate Cards display in the shopping page
    Fill the Login form         ${username}         ${password}
    wait until element is located in the page       ${dashboard_text}
    verify


*** Keywords ***


Fill the Login form
    [arguments]     ${username}     ${password}
    Wait Until Element Is Visible  name:username
    Input Text  name:username    ${username}
    Wait Until Element Is Visible  name:password
    Input Password    name:password    ${password}
    Click Button       xpath://button[@type="submit"]


wait until element is located in the page
    [arguments]     ${element_to_look}
    Wait Until Element Is Visible   ${element_to_look}

verify error message is correct
    ${result}=      Get Text    ${error_message}
    Should Be Equal As Strings    ${result}    Invalid credentials
    Element Text Should Be  ${error_message}    Invalid credentials

