[Documentation]    Suite for manager dashboard test cases.

***Settings***
# Importing selenium library
Library    SeleniumLibrary
Library    Collections

# Import pages used for tests
Resource   ${EXECDIR}${/}Pages${/}login_page_locator.robot
Resource   ${EXECDIR}${/}Pages${/}manager_home_page_locators.robot

# Import test data and common keywords
Resource   ${EXECDIR}${/}Essentials${/}test_data.robot
Resource   ${EXECDIR}${/}Essentials${/}util.robot

***Variables***
@{LINKS_LIST}    New Customer    Edit Customer    Delete Customer
...  New Account    Edit Account    Delete Account
...  Deposit    Withdrawal    Fund Transfer
...  Change Password    Balance Enquiry    Mini Statement    Customised Statement

***Test Cases***
Validate Available Links In Manager Dashboard
    [Tags]    test-case    smoke-test
    [Setup]    Test Setup
    Remember Manager Home Page URL
    :FOR    ${LINKS}    IN    @{LINKS_LIST}
        \   Validate Links In Manager Homepage    ${LINKS}    ${LINKS}
    [Teardown]    Test Teardown

Validate Available Links Order In Manager Dashboard
    [Tags]    test-case
    [Setup]    Test Setup
    Remember Manager Home Page URL
    @{expected_links_order}=    Create List    Manager    New Customer
    ...    Edit Customer    Delete Customer    New Account    Edit Account   Delete Account
    ...    Deposit    Withdrawal    Fund Transfer    Change Password
    ...    Balance Enquiry    Mini Statement    Customised Statement    Log out
    ${actual_links_order}=    Get Available Links In Page
    Lists Should Be Equal    {actual_links_order}    ${expected_links_order}
    [Teardown]    Test Teardown

***Keywords***
Test Setup
    Launch Guru99 Bank Application
    Login To Guru99 Bank    ${USER_NAME}    ${PASSWORD}
    Guru99 Bank Manager Home Page Should Be Loaded    ${USER_NAME}

Test Teardown
    Quit Sessions

Remember Manager Home Page URL
    ${current_url}=    Get Location
    Set Test Variable    ${HOME_PAGE_URL}    ${current_url}

Validate Links In Manager Homepage
    [Arguments]    ${link}    ${expected_page}
    Click Link    ${link}
    Page Should Contain    ${expected_page}
    Go To    ${HOME_PAGE_URL}
    Guru99 Bank Manager Home Page Should Be Loaded    ${USER_NAME}