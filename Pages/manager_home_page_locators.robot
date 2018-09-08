[Documentation]    This file consist of manager home page locators and keywords.

***Settings***
Library  SeleniumLibrary

***Variables***
${logged_manager_field}=    css:.heading3 td
${welcome_message}=    tag:marquee
${list_of_links}=    css:.menusubnav a
${reset_field}=    name:btnReset

&{LINKS}
...  manager=link:Manager
...  new_customer=link:New Customer
...  edit_customer=link:Edit Customer
...  delete_customer=link:Delete Customer
...  new_account=link:New Account
...  edit_account=link:Edit Account
...  delete_account=link:Delete Account

...  deposit=link:Deposit
...  withdrawl=link:Withdrawal
...  fund_transfer=link:Fund Transfer
...  change_password=link:Change Password
...  balance_enquiry=link:Balance Enquiry
...  mini_statement=link:Mini Statement
...  customised_statement=link:Customised Statement
...  logout=link:Log out

***Keywords***
Guru99 Bank Manager Home Page Should Be Loaded
    [Documentation]    Keyword is used to wait until Manager Home page is loaded
    [Arguments]    ${manager_id}
    Wait Until Element Contains    ${logged_manager_field}    ${manager_id}
    Wait Until Element Is Visible    ${LINKS.logout}
    Title Should Be    Guru99 Bank Manager HomePage

Click Logout
    Wait Until Element Is Visible    ${LINKS.logout}
    Click Link    ${LINKS.logout}

Get Available Links In Page
    [Documentation]    Get's list of app link in homepage
    Wait Until Element Is Visible    ${list_of_links}
    @{locators}=     Get Webelements    ${list_of_links}
    # Create a list and append app config values to list
    @{result}=       Create List
    :FOR   ${locator}   in    @{locators}
        \       ${name}=    Get Text    ${locator}
        \       Append To List    ${result}    ${name}
    Log    ${result}
    [Return]    @{result}