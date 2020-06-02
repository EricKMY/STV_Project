*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open App
...                    AND    Create Wallet
...                    AND    Create a new budget with Incomes type
Test Teardown    Run Keywords    Click Element After It Is Visible    //*[@content-desc="Open"]
...                       AND    Delete Wallet
...                       AND    Close Application

*** Test Cases ***
Edit a Budget Type Field
    Click Element After It Is Visible    //*[@text="Incomes"]
    Wait Until Element Is Visible On Page    //*[@text="Budget"]    timeout=3s    error=Budgets page should be visible.
    Click Element After It Is Visible    id=action_edit_item
    Wait Until Element Is Visible On Page    //*[@text="Edit budget"]    timeout=3s    error=Edit budget page should be visible.
    Click Element After It Is Visible    id=type_edit_text
    Wait Until Element Is Visible On Page    //*[@text="Budget types"]    timeout=3s    error=Budget types dialog should be visible.
    Click Element After It Is Visible    //*[@text="Expenses"]
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Budget"]    timeout=3s    error=Budgets page should be visible.
    Wait Until Element Is Visible On Page    //*[@text="Expenses"]    timeout=3s    error=Type should be Incomes.
    Go Back To List

*** Keywords ***
Create a new budget with Incomes type
    Click Element After It Is Visible    //*[@text="Budgets"]
    Wait Until Element Is Visible On Page    //*[@text="Budgets"]    timeout=3s    error=Budgets page should be visible.
    Click Element After It Is Visible    id=floating_action_button
    Wait Until Element Is Visible On Page    //*[@text="New budget"]    timeout=3s    error=New budget page should be visible.
    Click Element After It Is Visible    id=type_edit_text
    Wait Until Element Is Visible On Page    //*[@text="Budget types"]    timeout=3s    error=Budget types dialog should be visible.
    Click Element After It Is Visible    //*[@text="Incomes"]
    Wait Until Element Is Visible On Page    //*[@text="Incomes"]    timeout=3s    error=Type should be Incomes.
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Budgets"]    timeout=3s    error=Budgets page should be visible.
    Wait Until Element Is Visible On Page    //*[@text="Incomes"]    timeout=3s    error=Type should be Incomes.