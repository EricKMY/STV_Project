*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open App
...                    AND    Create Wallet
Test Teardown    Run Keywords    Click Element After It Is Visible    //*[@content-desc="Open"]
...                       AND    Delete Wallet
...                       AND    Close Application

*** Test Cases ***
Create a new Transaction
    Click Element After It Is Visible    //*[@text="Transactions"]
    Wait Until Element Is Visible On Page    //*[@text="Transactions"]    timeout=3s    error=Transactions page should be visible.
    Click Element After It Is Visible    id=floating_action_button
    Wait Until Element Is Visible On Page    //*[@text="New transaction"]    timeout=3s    error=New transaction page should be visible.
    Input Text After It Is Visible    id=description_edit_text    Lunch
    Click Element After It Is Visible    id=category_edit_text
    Wait Until Element Is Visible On Page    //*[@text="Pick a category"]    timeout=3s    error=Picking category page should be visible.
    Click Element After It Is Visible    //*[@text="Food and drinks"]
    Wait Until Element Is Visible On Page    //*[@text="New transaction"]    timeout=3s    error=New transaction page should be visible.
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Transactions"]    timeout=3s    error=Transactions page should be visible.
    Wait Until Element Is Visible On Page    //*[@text="Food and drinks" and following-sibling::*[@text="Lunch"]]    timeout=3s    error=Transaction with category: "Food and drinks" and description: "Lunch" should be visible.