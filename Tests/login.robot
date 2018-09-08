[Documentation]    Suite for login test cases.

***Settings***
# Importing selenium library
Library    SeleniumLibrary

# Import pages used for tests
Resource   ${EXECDIR}${/}Pages${/}login_page_locator.robot
Resource   ${EXECDIR}${/}Pages${/}manager_home_page_locators.robot

# Import test data and common keywords
Resource   ${EXECDIR}${/}Essentials${/}test_data.robot
Resource   ${EXECDIR}${/}Essentials${/}util.robot

***Test Cases***
Login To Guuru99 Bank With Valid Credentials
    [Tags]    test-case    smoke-test
    [Setup]    Test Setup
    Login To Guru99 Bank    ${USER_NAME}    ${PASSWORD}
    Guru99 Bank Manager Home Page Should Be Loaded    ${USER_NAME}
    [Teardown]    Test Teardown

Login To Guuru99 Bank With InValid Credentials
    [Tags]    test-case
    [Setup]    Test Setup
    Login To Guru99 Bank    ${INVALID_USER_NAME}    ${INVALID_PASSWORD}
    Alert Should Be Present    User or Password is not valid
    Guru99 Bank Login Page Should Be Loaded
    [Teardown]    Test Teardown

Login To Guuru99 Bank With Blank Credentials
    [Tags]    test-case
    [Setup]    Test Setup
    Login To Guru99 Bank    ${EMPTY}    ${EMPTY}
    Alert Should Be Present    User or Password is not valid
    Guru99 Bank Login Page Should Be Loaded
    [Teardown]    Test Teardown

Login To Guuru99 Bank With Blank User Name
    [Tags]    test-case
    [Setup]    Test Setup
    Login To Guru99 Bank    ${EMPTY}    ${PASSWORD}
    User Name Mandatory Text Should Be    User-ID must not be blank
    Guru99 Bank Login Page Should Be Loaded
    [Teardown]    Test Teardown

Login To Guuru99 Bank With Blank Password
    [Tags]    test-case
    [Setup]    Test Setup
    Login To Guru99 Bank    ${USER_NAME}    ${EMPTY}
    Password Mandatory Text Should Be    Password must not be blank
    Guru99 Bank Login Page Should Be Loaded
    [Teardown]    Test Teardown

Validate Reset In Login
    [Tags]    test-case
    [Setup]    Test Setup
    Login To Guru99 Bank    ${USER_NAME}    ${PASSWORD}
    Enter User Name    ${USER_NAME}
    Enter Password    ${PASSWORD}
    Click Reset
    User Name Field Value Should Be    ${EMPTY}
    Password Field Value Should Be    ${EMPTY}
    [Teardown]    Test Teardown

Validate Logout From Guru99 Bank When Navigate Back
    [Tags]    test-case
    [Setup]    Test Setup
    Login To Guru99 Bank    ${USER_NAME}    ${PASSWORD}
    Guru99 Bank Manager Home Page Should Be Loaded    ${USER_NAME}
    ${manager_home_page_url}=    Get Location
    Go Back
    Guru99 Bank Login Page Should Be Loaded
    Go To    ${manager_home_page_url}
    Guru99 Bank Login Page Should Be Loaded    
    [Teardown]    Test Teardown

***Keywords***
Test Setup
    Launch Guru99 Bank Application

Test Teardown
    Quit Sessions