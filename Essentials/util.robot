[Documentation]    This file consist of re-usable keywords used in project.

***Settings***
Library    SeleniumLibrary

***Keywords***
Launch Guru99 Bank Application
    [Documentation]    Launch guru 99 bank application in ${BROWSER}
    Open Browser    ${GURU_99_BANK_URL}    ${BROWSER}
    Set Selenium Timeout    ${SEL_TIMEOUT}
    Guru99 Bank Login Page Should Be Loaded

Login To Guru99 Bank
    [Arguments]    ${user_name}    ${password}
    Enter User Name    ${user_name}
    Enter Password    ${password}
    Click Login

Quit Sessions
    Close All Browsers