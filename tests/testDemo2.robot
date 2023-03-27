*** Settings ***
Documentation   To validate the Login form
Library         SeleniumLibrary
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close Browser Session
Resource        ../PO/Generic.robot
#selenium

*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***
Validate UnSuccesrsful Login
    [Tags]      SMOKE
#    open the browser with the Mortgage payment url
    Fill the login Form
    wait until it checks and displays error message
    verify error message is correct

*** Keywords ***
#open the browser with the Mortgage payment url
#    create Webdriver    Chrome  executable_path=C:/Users/Admin/PycharmProjects/RobotFramework/webdriver/chromedriver.exe
#    Go To               https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text      id:username     ${username}
    Input Password  id:password     ${invalid_password}
    Click Button    signInBtn

wait until it checks and displays error message
    Wait Until Element Is Visible   ${Error_Message_Login}

verify error message is correct
    ${result}=  Get Text    ${Error_Message_Login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be  ${Error_Message_Login}  Incorrect username/password.