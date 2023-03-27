*** Settings ***
Documentation   All the pade objects and keywords of landing page
Library         SeleniumLibrary
Resource        ../PO/Generic.robot

*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Keywords ***
Wait Until Element Is Located in the page
    Generic.Wait Until Element Is Located on page       ${Error_Message_Login}

Fill the login Form
    [arguments]     ${username}     ${password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        signInBtn

verify error message is correct
    ${result}=  Get Text    ${Error_Message_Login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be  ${Error_Message_Login}  Incorrect username/password.

Fill the Login Details and Login Form
    [arguments]     ${username}     ${password}     ${useroption}       ${dropdownoption}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Element       xpath://input[@value='${useroption}']
#    Wait Until Element Is Located in the page       okayBtn
    wait until element is visible               okayBtn
    Click Element       okayBtn
    wait until element is not visible               okayBtn
    Select From List By Value   css:select.form-control     ${dropdownoption}
    Select Checkbox     terms
    Checkbox Should Be Selected     terms