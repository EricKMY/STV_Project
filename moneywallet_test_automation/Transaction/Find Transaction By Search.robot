*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Suite Setup    Run Keywords    Open App
...                    AND    Create Wallet
...                    AND    Create a Transaction    Lunch
...                    AND    Create a Transaction    Dinner
Suite Teardown    Run Keywords    Click Element After It Is Visible    //*[@content-desc="Open"]
...                        AND    Delete Wallet
...                        AND    Close Application

*** Test Cases ***
Search Transaction by name
    Click Element After It Is Visible    id=action_search_item
    Wait Until Element Is Visible On Page    //*[@text="Search something"]    timeout=3s    error=Search page should be visible.
    Input Text After It Is Visible    id=search_edit_text    Lunch
    Wait Until Element Is Visible On Page    //*[@text="Food and drinks" and following-sibling::*[@text="Lunch"]]    timeout=3s    error=Transaction with category: "Food and drinks" and description: "Lunch" should be visible.
    Page Should Not Contain Element    //*[@text="Food and drinks" and following-sibling::*[@text="Dinner"]]
    Input Text After It Is Visible    id=search_edit_text    Dinner
    Wait Until Element Is Visible On Page    //*[@text="Food and drinks" and following-sibling::*[@text="Dinner"]]    timeout=3s    error=Transaction with category: "Food and drinks" and description: "Dinner" should be visible.
    Page Should Not Contain Element    //*[@text="Food and drinks" and following-sibling::*[@text="Lunch"]]
    Click Element After It Is Visible    //*[contains(@resource-id, "primary_toolbar")]/*[@class="android.widget.ImageButton"]
##refactor

Search Transaction by category
    Click Element After It Is Visible    id=action_search_item
    Wait Until Element Is Visible On Page    //*[@text="Search something"]    timeout=3s    error=Search page should be visible.
    Input Text After It Is Visible    id=search_edit_text    Food and drinks
    Wait Until Element Is Visible On Page    //*[@text="Food and drinks" and following-sibling::*[@text="Lunch"]]    timeout=3s    error=Transaction with category: "Food and drinks" and description: "Lunch" should be visible.
    Wait Until Element Is Visible On Page    //*[@text="Food and drinks" and following-sibling::*[@text="Dinner"]]    timeout=3s    error=Transaction with category: "Food and drinks" and description: "Dinner" should be visible.
    Click Element After It Is Visible    //*[contains(@resource-id, "primary_toolbar")]/*[@class="android.widget.ImageButton"]
##refactor
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