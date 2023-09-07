*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Test Setup      open the browser with the Mortgage payment url
Test Teardown       close browser session
Resource        resource.robot


*** Variables ***
${error_message}        css:.alert-danger


*** Test Cases ***

Validate Successful Login

    Fill the Login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***


Fill the Login form
    Wait Until Element Is Visible  id:username
    Input Text  id:username    ${username}
    Wait Until Element Is Visible  id:password
    Input Password    id:password    ${invalid_password}
    Click Button       signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible   ${error_message}
verify error message is correct
    ${result}=      Get Text    ${error_message}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be  ${error_message}    Incorrect username/password.

