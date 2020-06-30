*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Open App
Test Teardown    Run Keywords    Go Back To Secondary Page
...                       AND    Go Back To Primary Page
...                       AND    Click Element After It Is Visible    //*[@content-desc="Open"]
...                       AND    Delete Wallet
...                       AND    Close Application

*** Test Cases ***
Create a new wallet with name
    Input Wallet Name    Living Expenses
    Save Wallet
    Wallet Name Should Be    Living Expenses

Create a new wallet with amount
    Input Wallet Name    Living Expenses
    Input Amount    1234567890000
    Save Wallet
    Wallet Name Should Be    Living Expenses
    Wallet Amount Should Be    $ 1,234,567,890,000.00

Create a new wallet with note
    Input Wallet Name    Living Expenses
    Input Wallet Note    Stay alive
    Save Wallet
    Wallet Name Should Be    Living Expenses
    Wallet Note Should Be    Stay alive

Create a new wallet with amount and note
    Input Wallet Name    Living Expenses
    Input Amount    1234567890000
    Input Wallet Note    Stay alive
    Save Wallet
    Wallet Name Should Be    Living Expenses
    Wallet Amount Should Be    $ 1,234,567,890,000.00
    Wallet Note Should Be    Stay alive

Create a new wallet without name
    Wallet Without Name Should Not Be Saved
    [Teardown]    Close Application

*** Keywords ***
Input Wallet Name
    [Arguments]    ${name}
    Input Text After It Is Visible    id=name_edit_text    ${name}

Save Wallet
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Transactions"]    timeout=3s    error=Transactions page should be visible.

Wallet Name Should Be
    [Arguments]    ${name}
    Click Element After It Is Visible    //*[@content-desc="Open"]
    Click Element After It Is Visible    id=material_drawer_account_header_text_section
    Click Element After It Is Visible    //*[@text="Manage wallets"]
    Wait Until Element Is Visible On Page    //*[@text="Manage wallets"]    timeout=3s    error=Manage wallets page should be visible.
    Click Element After It Is Visible    //*[@text="${name}"]
    ${walletName} =    Get Text After It Is Visible    id=name_text_view
    Should Be Equal    ${name}    ${walletName}

Input Amount
    [Arguments]    ${amount}
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

Wallet Amount Should Be
    [Arguments]    ${amount}
    ${walletAmount} =    Get Text After It Is Visible    id=start_money_text_view
    Should Be Equal    ${amount}    ${walletAmount}

Input Wallet Note
    [Arguments]    ${note}
    Input Text After It Is Visible    id=note_edit_text    ${note}

Wallet Note Should Be
    [Arguments]    ${note}
    ${walletNote} =    Get Text After It Is Visible    id=note_text_view
    Should Be Equal    ${note}    ${walletNote}

Wallet Without Name Should Not Be Saved
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="New wallet"]    timeout=3s    error=Wallet page should be visible.
    Wait Until Page Does Not Contain Element    //*[@text="Transactions"]    timeout=3s    error=Transactions page should not be visible.