*** Settings ***
Documentation   A resource file with reusable keywords and variables.
...
...             The system specific keywords created here from our own
...             domain specific language. They utilize keywords provided
...             by the importd SeleniumLibrary.
Library         SeleniumLibrary
#Library         OperatingSystem

*** Variables ***
${chromedriver_path}    C:/Users/Admin/PycharmProjects/RobotFramework/webdriver/chromedriver.exe
${firefoxdriver_path}   C:/Users/Admin/PycharmProjects/RobotFramework/webdriver/geckodriver.exe
${edgedriver_path}      C:/Users/Admin/PycharmProjects/RobotFramework/webdriver/msedgedriver.exe
${url}                  https://rahulshettyacademy.com/loginpagePractise/
${user_name}            rahulshettyacademy
${invalid_password}     12345678
${valid_password}       learning
${browser_name}         Chrome

*** Keywords ***
open the browser with the Mortgage payment url
    create Webdriver    Chrome  executable_path=${chromedriver_path}
    Go To   ${url}

open the browser with the url
#    [arguments]         ${browser_name}
    create Webdriver    ${browser_name}  executable_path=resources/${browser_name}driver.exe
    Go To   ${url}

Close Browser Session
    Close Browser

Wait Until Element Is Located on page
    [arguments]     ${page_locator}
    Wait Until Element Is Visible       ${page_locator}      10 seconds