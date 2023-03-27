*** Settings ***
Documentation   All the pade objects and keywords of landing page
Library         SeleniumLibrary
Resource        ../PO/Generic.robot

*** Variables ***
${Shop_page_load}           css:.nav-link

*** Keywords ***
Wait Until Element Is Located in the page
    Generic.Wait Until Element Is Located on page       ${Shop_page_load}

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