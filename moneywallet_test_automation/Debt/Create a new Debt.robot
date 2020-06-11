*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open App
...                    AND    Create Wallet
Test Teardown    Run Keywords    Click Element After It Is Visible    //*[@content-desc="Open"]
...                       AND    Delete Wallet
...                       AND    Close Application

*** Test Cases ***
Create a new debt
    Click Element After It Is Visible    //*[@text="Debts"]
    Wait Until Element Is Visible On Page    //*[@text="Debts"]    timeout=3s    error=Debts page should be visible.
    Click Element After It Is Visible    id=floating_action_button
    Wait Until Element Is Visible On Page    //*[@text="New debt"]    timeout=3s    error=New debt page should be visible.
    Input Text After It Is Visible    id=description_edit_text    Home loan
    Click Element After It Is Visible    id=action_save_changes
    ${dialogTitle} =    Get Text After It Is Visible    id=md_title
    Should Be Equal    Well done    ${dialogTitle}
    ${dialogContent} =    Get Text After It Is Visible    id=md_content
    Should Be Equal    Do you want to add a master transaction for this debt?    ${dialogContent}
    Click Element After It Is Visible    //*[@text="OK"]
    Wait Until Element Is Visible On Page    //*[@text="Debts"]    timeout=3s    error=Debts page should be visible.
    Wait Until Element Is Visible On Page    //*[@text="Home loan"]    timeout=3s    error="Home loan" should be visible.