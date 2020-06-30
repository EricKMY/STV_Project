*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Open App
Test Teardown    Run Keywords    Go Back To List
...                       AND    Go Back To Database Page
...                       AND    Click Element After It Is Visible    //*[@content-desc="Open"]
...                       AND    Delete Wallet
...                       AND    Close Application

*** Test Cases ***
Create a new wallet with name
    Input Text After It Is Visible    id=name_edit_text    Living Expenses
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Transactions"]    timeout=3s    error=Transactions page should be visible.
    Click Element After It Is Visible    //*[@content-desc="Open"]
    Click Element After It Is Visible    id=material_drawer_account_header_text_section
    Click Element After It Is Visible    //*[@text="Manage wallets"]
    Wait Until Element Is Visible On Page    //*[@text="Manage wallets"]    timeout=3s    error=Manage wallets page should be visible.
    Click Element After It Is Visible    //*[@text="Living Expenses"]
    ${walletName} =    Get Text After It Is Visible    id=name_text_view
    Should Be Equal    Living Expenses    ${walletName}

Create a new wallet with amount
    Input Text After It Is Visible    id=name_edit_text    Living Expenses
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
    Click Element After It Is Visible    id=material_drawer_account_header_text_section
    Click Element After It Is Visible    //*[@text="Manage wallets"]
    Wait Until Element Is Visible On Page    //*[@text="Manage wallets"]    timeout=3s    error=Manage wallets page should be visible.
    Click Element After It Is Visible    //*[@text="Living Expenses"]
    ${walletName} =    Get Text After It Is Visible    id=name_text_view
    Should Be Equal    Living Expenses    ${walletName}
    ${walletAmount} =    Get Text After It Is Visible    id=start_money_text_view
    Should Be Equal    $ 1,234,567,890,000.00    ${walletAmount}

Create a new wallet with note
    Input Text After It Is Visible    id=name_edit_text    Living Expenses
    Input Text After It Is Visible    id=note_edit_text    Stay alive
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Transactions"]    timeout=3s    error=Transactions page should be visible.
    Click Element After It Is Visible    //*[@content-desc="Open"]
    Click Element After It Is Visible    id=material_drawer_account_header_text_section
    Click Element After It Is Visible    //*[@text="Manage wallets"]
    Wait Until Element Is Visible On Page    //*[@text="Manage wallets"]    timeout=3s    error=Manage wallets page should be visible.
    Click Element After It Is Visible    //*[@text="Living Expenses"]
    ${walletName} =    Get Text After It Is Visible    id=name_text_view
    Should Be Equal    Living Expenses    ${walletName}
    Wait Until Element Is Visible On Page    //*[@text="Wallet"]    timeout=3s    error=Wallet page should be visible.
    ${walletNote} =    Get Text After It Is Visible    id=note_text_view
    Should Be Equal    Stay alive    ${walletNote}

Create a new wallet with amount and note
    Input Text After It Is Visible    id=name_edit_text    Living Expenses
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
    Input Text After It Is Visible    id=note_edit_text    Stay alive
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Transactions"]    timeout=3s    error=Transactions page should be visible.
    Click Element After It Is Visible    //*[@content-desc="Open"]
    Click Element After It Is Visible    id=material_drawer_account_header_text_section
    Click Element After It Is Visible    //*[@text="Manage wallets"]
    Wait Until Element Is Visible On Page    //*[@text="Manage wallets"]    timeout=3s    error=Manage wallets page should be visible.
    Click Element After It Is Visible    //*[@text="Living Expenses"]
    ${walletName} =    Get Text After It Is Visible    id=name_text_view
    Should Be Equal    Living Expenses    ${walletName}
    ${walletAmount} =    Get Text After It Is Visible    id=start_money_text_view
    Should Be Equal    $ 1,234,567,890,000.00    ${walletAmount}
    ${walletNote} =    Get Text After It Is Visible    id=note_text_view
    Should Be Equal    Stay alive    ${walletNote}

Create a new wallet without name
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="New wallet"]    timeout=3s    error=Wallet page should be visible.
    Wait Until Page Does Not Contain Element    //*[@text="Transactions"]    timeout=3s    error=Transactions page should not be visible.
    [Teardown]    Close Application