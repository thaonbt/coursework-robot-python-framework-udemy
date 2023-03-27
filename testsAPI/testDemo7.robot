*** Settings ***
Library     Collections
Library     RequestsLibrary

*** Variables ***
${base_url}     http://216.10.245.166
${book_id}
${book_name}    RobotFramework

*** Test Cases ***
Play around with Dictionary
    [Tags]      API
    &{data}=   Create Dictionary       name=rahulshetty    course=robot     website=rahulshettyacademy.com
    log     ${data}
    Dictionary Should Contain Key      ${data}   name
    log     ${data}[name]
    ${url}=   get from dictionary                ${data}   website
    log     ${url}

Add Book into Library DataBase
    [Tags]      API
    &{req_body}=    Create Dictionary       name=${book_name}      isbn=132435      aisle=53421   author="John foe"

    ${response}=    POST    ${base_url}/Library/Addbook.php     json=${req_body}       expected_status=200
    log     ${response.json()}
#    {'Msg': 'successfully added', 'ID': '13243553421'}

    dictionary should contain key       ${response.json()}   ID
    ${book_id}=   get from dictionary   ${response.json()}   ID
    set global variable     ${book_id}
    log     ${book_id}

    Should be equal as Strings      successfully added     ${response.json()}[Msg]
    status should be    200         ${response}

Get the Book Details which got added
    [Tags]      API
    ${get_response}=    GET     ${base_url}/Library/GetBook.php     params=ID=${book_id}    expected_status=200
    log     ${get_response.json()}
#    [{'book_name': 'RobotFramework', 'isbn': '132435', 'aisle': '53421', 'author': '"John foe"'}]
    Should be equal as Strings      ${book_name}      ${get_response.json()}[0][book_name]

Delete the Book from databaser
    [Tags]      API
    &{delete_req}=   Create Dictionary       ID=${book_id}
    ${delete_response}=    POST    ${base_url}/Library/DeleteBook.php      json=${delete_req}      expected_status=200
    log     ${delete_response.json()}
#    {'msg': 'book is successfully deleted'}
    Should be equal as Strings  book is successfully deleted    ${delete_response.json()}[msg]

# Reach me at below email Id If you need assistance in Rest API Resume Preparation/ Rest
# Assured Interview Questions/ Rest API Material
# Email : mentor@rahulshettyacademy.com
#
# Library API :
# BaseURI : http://216.10.245.166
#
#    1. Resource: Library/Addbook.php            Method: POST
#
#        Input Payload : Json:
#        {
#            "name":"Learn Appium Automation with Java,
#            "isbn":"bcd",
#            "aisle":"227,
#            "author":"John foe"
#        }
#
#        Output Json
#        {
#            "Msg":"successfully added",
#            "ID":"bcd227"
#        }
#
#
#    1. Resource /Library/GetBook.php?AuthorName=somename        Method: GET
#
#        Output Json:
#        Output the array of Json object books with all below details
#
#        {
#            Name : "bookname"   ( String)
#            Isbn : "A2fdsf"     (String)
#            Aisle : 32          (Integer)
#        }
#
#
#    1. Resource: Library/GetBook.php?ID=3389        Method: GET
#
#        Output Json :
#        {
#            "book_name": "Selenium automation using Java",
#            "isbn": "a23hd738",
#            "aisle": "1223"
#        }
#
#
#    1. Resource:/Library/DeleteBook.php                 Method: POST
#
#        Input Payload : Json:
#        {
#            "ID" : "a23h345122332"
#        }
#
#        Output Response:
#        {
#            "msg" : "book is successfully deleted”
#        }