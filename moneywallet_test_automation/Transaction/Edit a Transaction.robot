*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open App
...                    AND    Create Wallet
...                    AND    Create a Transaction    Lunch
Test Teardown    Run Keywords    Click Element After It Is Visible    //*[@content-desc="Open"]
...                       AND    Delete Wallet
...                       AND    Close Application

*** Test Cases ***
Edit a Transaction
    Click Element After It Is Visible    //*[@text="Food and drinks" and following-sibling::*[@text="Lunch"]]
    Wait Until Element Is Visible On Page    //*[@text="Transaction"]    timeout=3s    error=Transaction page should be visible.
    Click Element After It Is Visible    id=action_edit_item
    Wait Until Element Is Visible On Page    //*[@text="Edit transaction"]    timeout=3s    error=Edit transaction page should be visible.
    Click Element After It Is Visible    id=category_edit_text
    Wait Until Element Is Visible On Page    //*[@text="Pick a category"]    timeout=3s    error=Picking category page should be visible.
    Click Element After It Is Visible    //*[@text="Hobby"]
    Wait Until Element Is Visible On Page    //*[@text="Edit transaction"]    timeout=3s    error=Edit transaction page should be visible.
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Transaction"]    timeout=3s    error=Transaction page should be visible.
    Go Back To List
    Wait Until Element Is Visible On Page    //*[@text="Transactions"]    timeout=3s    error=Transactions page should be visible.
    Wait Until Element Is Visible On Page    //*[@text="Hobby" and following-sibling::*[@text="Lunch"]]    timeout=3s    error=Transaction with category: "Hobby" and description: "Lunch" should be visible.

*** Keywords ***
Create A Transaction
    [Arguments]    ${transactionName}
    Click Element After It Is Visible    //*[@text="Transactions"]
    Wait Until Element Is Visible On Page    //*[@text="Transactions"]    timeout=3s    error=Transactions page should be visible.
    Click Element After It Is Visible    id=floating_action_button
    Wait Until Element Is Visible On Page    //*[@text="New transaction"]    timeout=3s    error=New transaction page should be visible.
    Input Text After It Is Visible    id=description_edit_text    ${transactionName}
    Click Element After It Is Visible    id=category_edit_text
    Wait Until Element Is Visible On Page    //*[@text="Pick a category"]    timeout=3s    error=Picking category page should be visible.
    Click Element After It Is Visible    //*[@text="Food and drinks"]
    Wait Until Element Is Visible On Page    //*[@text="New transaction"]    timeout=3s    error=New transaction page should be visible.
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Transactions"]    timeout=3s    error=Transactions page should be visible.
    Wait Until Element Is Visible On Page    //*[@text="Food and drinks" and following-sibling::*[@text="${transactionName}"]]    timeout=3s    error=Transaction with category: "Food and drinks" and description: "${transactionName}" should be visible.