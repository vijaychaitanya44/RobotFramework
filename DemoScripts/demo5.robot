*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections
Test Setup      open the browser with the Mortgage payment url
#Test Teardown       close browser session
Resource        resource.robot


*** Variables ***
${error_message}        css:.alert-danger
${checkout_cart}        xpath://div/ul/li/a[contains(@class,'nav-link')]


*** Test Cases ***

#Validate Successful Login

  #  Fill the Login form         ${username}     ${invalid_password}
  #  wait until element is located in the page       ${error_message}
  #  verify error message is correct


Validate Cards display in the shopping page
    Fill the Login form         ${username}         ${password}
    wait until element is located in the page       ${checkout_cart}
    verify card titles in the shop page
    Select the Card     iphone X


*** Keywords ***


Fill the Login form
    [arguments]     ${username}     ${password}
   #Wait Until Element Is Visible  id:username
    Input Text  id:username    ${username}
   #Wait Until Element Is Visible  id:password
    Input Password    id:password    ${password}
    Click Button       signInBtn


wait until element is located in the page
    [arguments]     ${element_to_look}
    Wait Until Element Is Visible   ${element_to_look}

verify error message is correct
    ${result}=      Get Text    ${error_message}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be  ${error_message}    Incorrect username/password.
verify card titles in the shop page
    @{expected_list}=       Create List     iphone X       Samsung Note 8       Nokia Edge      Blackberry
    ${elements}=        Get WebElements    xpath://h4[@class='card-title']
    @{actual_list}=         Create List
    FOR    ${element}    IN    @{elements}
        Log   ${element.text}
        Append To List      ${actual_list}   ${element.text}
    END
    Lists Should Be Equal       ${expected_list}        ${actual_list}



Select the Card
     [arguments]            ${cardname}
     ${elements}=        Get WebElements    css:.card-title
     ${index}=   Set Variable    1
     FOR    ${element}    IN    @{elements}
           Log   ${element.text}
           Exit For Loop If    '${cardname}' == '${element.text}'
           ${index}=  Evaluate  ${index} + 1
     END
   Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

