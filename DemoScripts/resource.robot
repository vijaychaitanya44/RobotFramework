*** Settings ***
Documentation       common methods for the testcases
...                 for multiple lines
...                 for multiple lines
Library         SeleniumLibrary


*** Variables ***
${url}      https://rahulshettyacademy.com/loginpagePractise/
${username}     rahulshettyacademy
${password}     learning
${invalid_password}     learning123

*** Keywords ***

open the browser with the Mortgage payment url
    Create Webdriver        Firefox
    Go To       ${url}
close browser session
    Close Browser