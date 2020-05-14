*** Settings ***
Library    AppiumLibrary
Test Setup    Run Keywords    Open App
    ...                AND    Create a new wallet without initial amount
Test Teardown    Run Keywords    Delete Wallet
...                       AND    Close Application

*** Test Cases ***
Edit a Wallet with wallet name
    Click Element After It Is Visible    //*[@content-desc="Open"]
    Wait Until Element Is Visible On Page    id=material_drawer_account_header_name    timeout=3s    error=Menu header name should be visible.
    ${walletName} =    Get Text    id=material_drawer_account_header_name
    Should Be Equal    Living Expenses    ${walletName}
    Click Element After It Is Visible    id=material_drawer_account_header_text_section
    Click Element After It Is Visible    //*[@text="Manage wallets"]
    Click Element After It Is Visible    //*[@text="Living Expenses"]
    Click Element After It Is Visible    id=action_edit_item
    Wait Until Element Is Visible On Page    id=name_edit_text    timeout=3s    error=Wallet name field should be visible.
    Input Text    id=name_edit_text    Entertainment Expenses
    Click Element After It Is Visible    id=start_money_edit_text
    Click Element After It Is Visible    id=keyboard_1_button
    Click Element After It Is Visible    id=keyboard_2_button
    Click Element After It Is Visible    id=keyboard_3_button
    Click Element After It Is Visible    id=keyboard_4_button
    Click Element After It Is Visible    id=keyboard_action_button
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    id=name_text_view    timeout=3s    error=Wallet name should be visible.
    ${walletName} =    Get Text    id=name_text_view
    Should Be Equal    Entertainment Expenses    ${walletName}
    Wait Until Element Is Visible On Page    id=start_money_text_view    timeout=3s    error=Wallet amount field should be visible.
    ${walletAmount} =    Get Text    id=start_money_text_view
    Should Be Equal    $ 1,234.00    ${walletAmount}

*** Keywords ***
Open App
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=7.1.1    deviceName=Pixel 2 API 25    app=C:\\Users\\lab1321\\Desktop\\moneywallet\\app\\proprietaryOsm\\release\\app-proprietary-osm-release.apk    appPackage=com.oriondev.moneywallet
    Click Element After It Is Visible    id=first_start_button
    Click Element After It Is Visible    id=skip
    Click Element After It Is Visible    id=done
    Wait Until Element Is Visible On Page    //*[@text="New wallet"]    timeout=3s    error=Wallet page should be visible.

Create a new wallet without initial amount
    Wait Until Element Is Visible On Page    id=name_edit_text    timeout=3s    error=Wallet name field should be visible.
    Input Text    id=name_edit_text    Living Expenses
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Transactions"]    timeout=3s    error=Transactions page should be visible.

Delete Wallet
    Click Element After It Is Visible    id=action_delete_item
    Wait Until Element Is Visible On Page    id=md_title    timeout=3s    error=Dialog should be visible.
    ${dialogTitle} =    Get Text    id=md_title
    Should Be Equal    Warning    ${dialogTitle}
    ${dialogContent} =    Get Text    id=md_content
    Should Be Equal    Are you sure you want to delete this wallet? All the related data will be removed.    ${dialogContent}
    Click Element After It Is Visible    id=md_buttonDefaultPositive
    Page Should Not Contain Element    //*[@text="Entertainment Expenses"]

Wait Until Element Is Visible On Page
    [Arguments]    ${locator}    ${timeout}    ${error}
    Wait Until Page Contains Element    ${locator}    timeout=${timeout}    error=${error}
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}    error=${error}

Click Element After It Is Visible
    [Arguments]    ${locator}
    Wait Until Element Is Visible On Page    ${locator}    timeout=3s    error=Element should be visible.
    Click Element    ${locator}