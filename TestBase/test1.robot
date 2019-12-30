*** Settings ***
Library  SeleniumLibrary
Library     requests
Library     ServiceRequest.py

*** Variables ***
${LOGIN URL}    https://clarity.dexcom.com/
${BROWSER}      Chrome
${SUBJECTID}    1594950620847472640
${password}
${username}

*** Test Cases ***
Test_Login
    Open Browser to Clarity Page
    Go To HomeUser
    Input Username
    Input Password
    Submit Credentials
    Get Session
    Authorize Session

*** Keywords ***
Open Browser to Clarity Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Dexcom CLARITY

Go To HomeUser
    Click Button    xpath:/html/body/div[1]/div[1]/div/div[2]/div/nav/ul/li[1]/div/a
    Title Should Be     Dexcom - Account Management

Input Username
    [Arguments] ${username}
    Input Text  id:usename ${username}

Input Password
    [Arguments] ${password}
    Input Text  id:password   ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Title Should Be     Dexcom CLARITY

Get Session
    ${sessioninfo} =    call method  getsession()

Authorize Session
    ${sessiondata} =    call method  authorizesession()
    should be equal as numbers      ${sessiondata.data.subjectID()} 1594950620847472640

