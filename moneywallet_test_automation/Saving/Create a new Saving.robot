*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open App
...                    AND    Create Wallet
Test Teardown    Run Keywords    Click Element After It Is Visible    //*[@content-desc="Open"]
...                       AND    Delete Wallet
...                       AND    Close Application

*** Test Cases ***
Create a new saving
    Click Element After It Is Visible    //*[@text="Savings"]
    Wait Until Element Is Visible On Page    //*[@text="Savings"]    timeout=3s    error=Savings page should be visible.
    Click Element After It Is Visible    id=floating_action_button
    Wait Until Element Is Visible On Page    //*[@text="New saving"]    timeout=3s    error=New saving page should be visible.
    Input Text After It Is Visible    id=description_edit_text    Pocket money
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Savings"]    timeout=3s    error=Savings page should be visible.
    Wait Until Element Is Visible On Page    //*[@text="Pocket money"]    timeout=3s    error="Pocket money" should be visible.