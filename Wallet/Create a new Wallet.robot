*** Settings ***
Library    AppiumLibrary
Test Setup    Run Keywords    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=7.1.1    deviceName=Pixel 2 API 25    app=C:\\Users\\lab1321\\Desktop\\moneywallet\\app\\proprietaryOsm\\release\\app-proprietary-osm-release.apk    appPackage=com.oriondev.moneywallet
    ...                AND    Click Element After It Is Visible    id=first_start_button
    ...                AND    Click Element After It Is Visible    id=skip
    ...                AND    Click Element After It Is Visible    id=done
    ...                AND    Wait Until Element Is Visible On Page    //*[@text="New wallet"]    timeout=3s    error=Wallet page should be visible.
Test Teardown    Run Keywords    Delete Wallet
    ...                   AND    Close Application

*** Test Cases ***
Create a new wallet without initial amount
    Wait Until Element Is Visible On Page    id=name_edit_text    timeout=3s    error=!!!!
    Input Text    id=name_edit_text    Living Expenses
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Transactions"]    timeout=3s    error=Transactions page should be visible.
    Click Element After It Is Visible    //*[@content-desc="Open"]
    ${walletName} =    Get Text    id=material_drawer_account_header_name
    Should Be Equal    Living Expenses    ${walletName}

Create a new wallet with initial amount
    Wait Until Element Is Visible On Page    id=name_edit_text    timeout=3s    error=!!!!
    Input Text    id=name_edit_text    Living Expenses
    Click Element After It Is Visible    id=start_money_edit_text
    Click Element After It Is Visible    id=keyboard_1_button
    Click Element After It Is Visible    id=keyboard_2_button
    Click Element After It Is Visible    id=keyboard_3_button
    Click Element After It Is Visible    id=keyboard_4_button
    Click Element After It Is Visible    id=keyboard_5_button
    Click Element After It Is Visible    id=keyboard_6_button
    Click Element After It Is Visible    id=keyboard_7_button
    Click Element After It Is Visible    id=keyboard_8_button
    Click Element After It Is Visible    id=keyboard_9_button
    Click Element After It Is Visible    id=keyboard_0_button
    Click Element After It Is Visible    id=keyboard_000_button
    Click Element After It Is Visible    id=keyboard_action_button
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Transactions"]    timeout=3s    error=Transactions page should be visible.
    Click Element After It Is Visible    //*[@content-desc="Open"]
    ${walletName} =    Get Text    id=material_drawer_account_header_name
    Should Be Equal    Living Expenses    ${walletName}
    Wait Until Element Is Visible On Page    id=material_drawer_account_header_email    timeout=3s    error=Wallet amount should be visible.
    ${walletAmount} =    Get Text    id=material_drawer_account_header_email
    Should Be Equal    $ 1,234,567,890,000.00    ${walletAmount}

*** Keywords ***
Delete Wallet
    Click Element After It Is Visible    id=material_drawer_account_header_text_section
    Click Element After It Is Visible    //*[@text="Manage wallets"]
    Wait Until Element Is Visible On Page    //*[@text="Manage wallets"]    timeout=3s    error=Manage wallets page should be visible.
    Click Element After It Is Visible    //*[@text="Living Expenses"]
    Wait Until Element Is Visible On Page    //*[@text="Wallet"]    timeout=3s    error=Wallet page should be visible.
    Click Element After It Is Visible    id=action_delete_item
    Wait Until Element Is Visible On Page    id=md_title    timeout=3s    error=Dialog should be visible.
    ${dialogTitle} =    Get Text    id=md_title
    Should Be Equal    Warning    ${dialogTitle}
    ${dialogContent} =    Get Text    id=md_content
    Should Be Equal    Are you sure you want to delete this wallet? All the related data will be removed.    ${dialogContent}
    Click Element After It Is Visible    id=md_buttonDefaultPositive
    Page Should Not Contain Element    //*[@text="Living Expenses"]

Click First Time Button
    Click Element    id=first_start_button
    
Wait Until Element Is Visible On Page
    [Arguments]    ${locator}    ${timeout}    ${error}
    Wait Until Page Contains Element    ${locator}    timeout=${timeout}    error=${error}
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}    error=${error}

Click Element After It Is Visible
    [Arguments]    ${locator}
    Wait Until Element Is Visible On Page    ${locator}    timeout=3s    error=Element should be visible.
    Click Element    ${locator}