*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open App
...                    AND    Create a new wallet without initial amount
Test Teardown    Close Application

*** Test Cases ***
Delete a Wallet
    Click Element After It Is Visible    //*[@content-desc="Open"]
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

*** Keywords ***
Create a new wallet without initial amount
    Wait Until Element Is Visible On Page    id=name_edit_text    timeout=3s    error=Wallet name field should be visible.
    Input Text    id=name_edit_text    Living Expenses
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Transactions"]    timeout=3s    error=Transactions page should be visible.