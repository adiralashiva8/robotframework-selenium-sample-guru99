[Documentation]    This file consist of login page locators and keywords.

***Settings***
Library  SeleniumLibrary

***Variables***
${user_name_field}=    name:uid
${password_field}=    xpath://input[@name='password']
${login_field}=    css:input[value="LOGIN"]
${reset_field}=    name:btnReset
${user_name_mandatory_field}=    id:message23
${password_mandatory_field}=    id:message18

***Keywords***
Guru99 Bank Login Page Should Be Loaded
    [Documentation]    Keyword is used to wait until login page is loaded
    Wait Until Element Is Visible    ${login_field}
    Location Should Contain    v4/index.php

Enter User Name
    [Arguments]    ${user_name}
    Wait Until Element Is Visible    ${user_name_field}
    Input Text    ${user_name_field}    ${user_name}

Enter Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${password_field}
    Input Text    ${password_field}    ${password}

Click Login
    Wait Until Element Is Visible  ${login_field}
    Click Element  ${login_field}

Click Reset
    Wait Until Element Is Visible    ${reset_field}
    Click Element    ${reset_field}

User Name Mandatory Text Should Be
    [Arguments]    ${text}
    Wait Until Element Contains    ${user_name_mandatory_field}    ${text}

Password Mandatory Text Should Be
    [Arguments]    ${text}
    Wait Until Element Contains    ${password_mandatory_field}    ${text}

User Name Field Value Should Be
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${user_name_field}
    Text Field Value Should Be    ${user_name_field}    ${value}

Password Field Value Should Be
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${password_field}
    Text Field Value Should Be    ${password_field}    ${value}