*** Settings ***
Documentation   To validate the Login form
Library         SeleniumLibrary
Library         Collections
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close Browser Session
Resource        ../PO/Generic.robot
#selenium

*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link

*** Test Cases ***
#Validate UnSuccesrsful Login
##    open the browser with the Mortgage payment url
#    Fill the login Form
#    Wait Until Element Is Located in the page   ${Error_Message_Login}
#    verify error message is correct

#Validate Cards display in the Shopping Page
#    Fill the login Form     ${user_name}     ${valid_password}
#    Wait Until Element Is Located in the page    ${Shop_page_load}
#    Verify Card Titles in the Shop page
#    Select the Card     Blackberry

Select the Form and navigate to Child window

    Fill the Login Details and Login Form     ${user_name}     ${valid_password}    user    teach

*** Keywords ***
#open the browser with the Mortgage payment url
#    create Webdriver    Chrome  executable_path=C:/Users/Admin/PycharmProjects/RobotFramework/webdriver/chromedriver.exe
#    Go To               https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    [arguments]     ${username}=${user_name}     ${password}=${invalid_password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        signInBtn

Wait Until Element Is Located in the page
    [arguments]     ${element}
    Wait Until Element Is Visible       ${element}      10 seconds

verify error message is correct
    ${result}=  Get Text    ${Error_Message_Login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be  ${Error_Message_Login}  Incorrect username/password.

Verify Card Titles in the Shop page
    @{expectedList} =   Create List     iphone X     Samsung Note 8     Nokia Edge     Blackberry
    ${elements} =       Get WebElements     css:.card-title
    @{actualList} =     Create List
    FOR     ${element}  IN  @{elements}
       Log     ${element.text}
       Append To List      ${actualList}       ${element.text}
    END
    lists should be equal   ${expectedList}     ${actualList}

Select the Card
    [arguments]     ${cardName}
    ${elements} =       Get WebElements     css:.card-title
    ${index} =  Set Variable    1
    FOR     ${element}  IN  @{elements}
        Exit For Loop If    '${cardName}' == '${element.text}'
        ${index}=   Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill the Login Details and Login Form
    [arguments]     ${username}     ${password}     ${useroption}       ${dropdownoption}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Element       xpath://input[@value='${useroption}']
    Wait Until Element Is Located in the page       okayBtn
    Click Element       okayBtn
    wait until element is not visible               okayBtn
    Select From List By Value   css:select.form-control     ${dropdownoption}
    Select Checkbox     terms
    Checkbox Should Be Selected     terms