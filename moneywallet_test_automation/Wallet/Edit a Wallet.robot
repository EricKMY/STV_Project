*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open App
...                    AND    Create a new wallet without initial amount
Test Teardown    Run Keywords    Go Back To List
...                       AND    Go Back To Database Page
...                       AND    Click Element After It Is Visible    //*[@content-desc="Open"]
...                       AND    Delete Wallet    Living Expenses
...                       AND    Close Application

*** Test Cases ***
Edit a Wallet name
    Click Element After It Is Visible    //*[@content-desc="Open"]
    ${walletName} =    Get Text After It Is Visible    id=material_drawer_account_header_name
    Should Be Equal    Living Expenses    ${walletName}
    Click Element After It Is Visible    id=material_drawer_account_header_text_section
    Click Element After It Is Visible    //*[@text="Manage wallets"]
    Click Element After It Is Visible    //*[@text="Living Expenses"]
    Click Element After It Is Visible    id=action_edit_item
    Wait Until Element Is Visible On Page    id=name_edit_text    timeout=3s    error=Wallet name field should be visible.
    Input Text After It Is Visible    id=name_edit_text    Entertainment Expenses
    Click Element After It Is Visible    id=action_save_changes
    ${walletName} =    Get Text After It Is Visible    id=name_text_view
    Should Be Equal    Entertainment Expenses    ${walletName}
    [Teardown]    Run Keywords    Go Back To List
    ...                    AND    Go Back To Database Page
    ...                    AND    Click Element After It Is Visible    //*[@content-desc="Open"]
    ...                    AND    Delete Wallet    Entertainment Expenses
    ...                    AND    Close Application

Edit a Wallet amount
    Click Element After It Is Visible    //*[@content-desc="Open"]
    ${walletName} =    Get Text After It Is Visible    id=material_drawer_account_header_name
    Should Be Equal    Living Expenses    ${walletName}
    Click Element After It Is Visible    id=material_drawer_account_header_text_section
    Click Element After It Is Visible    //*[@text="Manage wallets"]
    Click Element After It Is Visible    //*[@text="Living Expenses"]
    Click Element After It Is Visible    id=action_edit_item
    Wait Until Element Is Visible On Page    id=name_edit_text    timeout=3s    error=Wallet name field should be visible.
    Click Element After It Is Visible    id=start_money_edit_text
    Click Element After It Is Visible    id=keyboard_1_button
    Click Element After It Is Visible    id=keyboard_2_button
    Click Element After It Is Visible    id=keyboard_3_button
    Click Element After It Is Visible    id=keyboard_4_button
    Click Element After It Is Visible    id=keyboard_action_button
    Click Element After It Is Visible    id=action_save_changes
    ${walletAmount} =    Get Text After It Is Visible    id=start_money_text_view
    Should Be Equal    $ 1,234.00    ${walletAmount}

Edit a Wallet note
    Click Element After It Is Visible    //*[@content-desc="Open"]
    ${walletName} =    Get Text After It Is Visible    id=material_drawer_account_header_name
    Should Be Equal    Living Expenses    ${walletName}
    Click Element After It Is Visible    id=material_drawer_account_header_text_section
    Click Element After It Is Visible    //*[@text="Manage wallets"]
    Click Element After It Is Visible    //*[@text="Living Expenses"]
    Click Element After It Is Visible    id=action_edit_item
    Wait Until Element Is Visible On Page    id=name_edit_text    timeout=3s    error=Wallet name field should be visible.
    Input Text After It Is Visible    id=note_edit_text    Stay alive
    Click Element After It Is Visible    id=action_save_changes
    ${walletNote} =    Get Text After It Is Visible    id=note_text_view
    Should Be Equal    Stay alive    ${walletNote}

Edit a Wallet with name, amount and note
    Click Element After It Is Visible    //*[@content-desc="Open"]
    ${walletName} =    Get Text After It Is Visible    id=material_drawer_account_header_name
    Should Be Equal    Living Expenses    ${walletName}
    Click Element After It Is Visible    id=material_drawer_account_header_text_section
    Click Element After It Is Visible    //*[@text="Manage wallets"]
    Click Element After It Is Visible    //*[@text="Living Expenses"]
    Click Element After It Is Visible    id=action_edit_item
    Wait Until Element Is Visible On Page    id=name_edit_text    timeout=3s    error=Wallet name field should be visible.
    Input Text After It Is Visible    id=name_edit_text    Entertainment Expenses
    Click Element After It Is Visible    id=start_money_edit_text
    Click Element After It Is Visible    id=keyboard_1_button
    Click Element After It Is Visible    id=keyboard_2_button
    Click Element After It Is Visible    id=keyboard_3_button
    Click Element After It Is Visible    id=keyboard_4_button
    Click Element After It Is Visible    id=keyboard_action_button
    Input Text After It Is Visible    id=note_edit_text    Stay alive
    Click Element After It Is Visible    id=action_save_changes
    ${walletName} =    Get Text After It Is Visible    id=name_text_view
    Should Be Equal    Entertainment Expenses    ${walletName}
    ${walletAmount} =    Get Text After It Is Visible    id=start_money_text_view
    Should Be Equal    $ 1,234.00    ${walletAmount}
    ${walletNote} =    Get Text After It Is Visible    id=note_text_view
    Should Be Equal    Stay alive    ${walletNote}
    [Teardown]    Run Keywords    Go Back To List
    ...                    AND    Go Back To Database Page
    ...                    AND    Click Element After It Is Visible    //*[@content-desc="Open"]
    ...                    AND    Delete Wallet    Entertainment Expenses
    ...                    AND    Close Application

Edit a Wallet with empty name
    Click Element After It Is Visible    //*[@content-desc="Open"]
    ${walletName} =    Get Text After It Is Visible    id=material_drawer_account_header_name
    Should Be Equal    Living Expenses    ${walletName}
    Click Element After It Is Visible    id=material_drawer_account_header_text_section
    Click Element After It Is Visible    //*[@text="Manage wallets"]
    Click Element After It Is Visible    //*[@text="Living Expenses"]
    Click Element After It Is Visible    id=action_edit_item
    Wait Until Element Is Visible On Page    id=name_edit_text    timeout=3s    error=Wallet name field should be visible.
    Input Text After It Is Visible    id=name_edit_text    ${EMPTY}
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Edit wallet"]    timeout=3s    error=Edit wallet page should be visible.
    Wait Until Page Does Not Contain Element    //*[@text="Wallet"]    timeout=3s    error=Wallet page should not be visible.
    [Teardown]    Run Keywords    Go Back To Database Page
    ...                    AND    Go Back To List
    ...                    AND    Go Back To Database Page
    ...                    AND    Click Element After It Is Visible    //*[@content-desc="Open"]
    ...                    AND    Delete Wallet    Living Expenses
    ...                    AND    Close Application

*** Keywords ***
Create a new wallet without initial amount
    Wait Until Element Is Visible On Page    id=name_edit_text    timeout=3s    error=Wallet name field should be visible.
    Input Text    id=name_edit_text    Living Expenses
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Transactions"]    timeout=3s    error=Transactions page should be visible.