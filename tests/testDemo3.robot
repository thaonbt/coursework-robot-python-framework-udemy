*** Settings ***
Documentation   To validate the Login form
Library         SeleniumLibrary
Library         Collections
Library         String
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close Browser Session
Resource        ../PO/Generic.robot
#selenium

*** Variables ***

*** Test Cases ***
Validate Child window Functionality
    [Tags]      SMOKE
    Select the link of Child window
    Verify the user is switched to Child window
    Grab the Email id in the Child window
    Switch to Parent window and Enter the Email

*** Keywords ***
Select the link of Child window
    click element       css:.blinkingText
    sleep               10 seconds

Verify the user is switched to Child window
    switch window       NEW
    element text should be      css:h1      DOCUMENTS REQUEST

Grab the Email id in the Child window
    ${text} =   get text    css:p.im-para.red
    @{words} =  split string    ${text}     at
    #0 -> 'Please email us '
    #1 -> ' mentor@rahulshettyacademy.com with below template to receive response'
    ${text_split} =     get from list   ${words}    1
    log     ${text_split}
    @{words_2} =  split string    ${text_split}
    #0 -> 'mentor@rahulshettyacademy.com'
    #1 -> 'with below template to receive response'
    ${email} =     get from list    ${words_2}      0
    Set Global Variable     ${email}

Switch to Parent window and Enter the Email
    switch window       MAIN
    title should be     LoginPage Practise | Rahul Shetty Academy
    Input Text          id:username     ${email}
