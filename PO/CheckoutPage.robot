*** Settings ***
Documentation   All the pade objects and keywords of landing page
Library         SeleniumLibrary
Resource        ../PO/Generic.robot

*** Variables ***
${Checkout_page_load}           css:span.glyphicon-play

*** Keywords ***
Wait Until Element Is Located in the page
    Generic.Wait Until Element Is Located on page       ${Checkout_page_load}

Verify items in the checkout page and proceed
#    scripts for verify
    click element       css:.btn-success
