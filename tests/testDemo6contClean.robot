*** Settings ***
Documentation   To validate the Login form
Library         SeleniumLibrary
Library         Collections
Library         ../customLibraries/Shop.py
#Test Setup      open the browser with the url       firefox
Test Setup      open the browser with the url
Suite Setup
Suite Teardown
Test Teardown   Close Browser Session
Resource        ../PO/Generic.robot
Resource        ../PO/LandingPage.robot
Resource        ../PO/ShopPage.robot
Resource        ../PO/CheckoutPage.robot
Resource        ../PO/ConfirmationPage.robot
#selenium

*** Variables ***
@{listofproducts}           Backberry       Nokia Edge
${country_name}             India

*** Test Cases ***
Validate UnSuccesrsful Login
#    [Tags]      SMOKE
    LandingPage.Fill the login Form     ${user_name}     ${invalid_password}
    LandingPage.Wait Until Element Is Located in the page
    LandingPage.verify error message is correct

#Validate Cards display in the Shopping Page
End to end ecommerce Product validation
    [Tags]      REGRESSION
    LandingPage.Fill the login Form     ${user_name}     ${valid_password}
    ShopPage.Wait Until Element Is Located in the page
    ShopPage.Verify Card Titles in the Shop page
    add items to cart and checkout      ${listofproducts}
    CheckoutPage.Verify items in the checkout page and proceed
    ConfirmationPage.Enter the Country      ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase

Select the Form and navigate to Child window
   LandingPage. Fill the Login Details and Login Form     ${user_name}     ${valid_password}    user    teach

*** Keywords ***


