*** Settings ***
Library  SeleniumLibrary
Library     requests
Library     ServiceRequest.py
Library     ClarityHomePage.py  Chrome
Suite Setup  Open
Suite Teardown  Close

*** Variables ***
${LOGIN URL}    https://clarity.dexcom.com/
${BROWSER}      Chrome
${SUBJECTID}    1594950620847472640
${password}     Password@1
${username}     nilepatest001

*** Test Cases ***
Test_Login
    Open Browser To Clarity Login Page
    Login As Home User
    Get Session
    Authorize Session
    Close Browser


*** Keywords ***
Open Browser To Clarity Login Page
    Open
    select home user

Login As Home User
    input username  ${username}
    input password  ${password}
    select login


Get Session
    ${sessioninfo} =    call method  getsession()

Authorize Session
    ${sessiondata} =    call method  authorizesession()
    should be equal as numbers      ${sessiondata.data.subjectID()} 1594950620847472640

Close Browser
    Close

