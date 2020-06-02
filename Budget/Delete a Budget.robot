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
Delete a Budget
    Click Element After It Is Visible    //*[@text="Incomes"]
    Wait Until Element Is Visible On Page    //*[@text="Budget"]    timeout=3s    error=Budgets page should be visible.
    Click Element After It Is Visible    id=action_delete_item
    Wait Until Element Is Visible On Page    id=md_title    timeout=3s    error=Dialog should be visible.
    ${dialogTitle} =    Get Text    id=md_title
    Should Be Equal    Warning    ${dialogTitle}
    ${dialogContent} =    Get Text    id=md_content
    Should Be Equal    Are you sure you want to delete this budget?    ${dialogContent}
    Click Element After It Is Visible    id=md_buttonDefaultPositive
    Page Should Not Contain Element    //*[@text="Incomes"]

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