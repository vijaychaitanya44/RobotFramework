*** Settings ***
Documentation       common methods for the testcases
...                 for multiple lines
...                 for multiple lines
Library         SeleniumLibrary


*** Variables ***
${url}      https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${username}     Admin
${password}     admin123
${invalid_password}     learning

*** Keywords ***

open the browser with the Mortgage payment url
    Create Webdriver        Firefox
    Go To       ${url}
close browser session
    Close Browser