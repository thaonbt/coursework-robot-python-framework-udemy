*** Settings ***
Documentation   All the pade objects and keywords of landing page
Library         SeleniumLibrary
Resource        ../PO/Generic.robot

*** Variables ***
${Confirmation_page_load}           css:app-checkout.row
#${country_location}                 //a[text()='India']

*** Keywords ***
Wait Until Element Is Located in the page
    Generic.Wait Until Element Is Located on page       ${Confirmation_page_load}

Enter the Country
    [arguments]         ${country_name}
    input text          country     ${country_name}
    Generic.Wait Until Element Is Located on page       //a[text()='${country_name}']
    click element       //a[text()='${country_name}']
    click element       css:.checkbox label

Purchase the Product and Confirm the Purchase
    click button        css:.btn-success
    page should contain     Success!