*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open App
...                    AND    Create Wallet
...                    AND    Create A New Debt    Home loan
Test Teardown    Run Keywords    Go Back To List
...                       AND    Click Element After It Is Visible    //*[@content-desc="Open"]
...                       AND    Delete Wallet
...                       AND    Close Application

*** Test Cases ***
Edit a Debt description field
    Click Element After It Is Visible    //*[@text="Home loan"]
    Wait Until Element Is Visible On Page    //*[@text="Debt"]    timeout=3s    error=Debt page should be visible.
    Click Element After It Is Visible    //*[@content-desc="More options"]
    Click Element After It Is Visible    //*[@text="Edit"]
    Wait Until Element Is Visible On Page    //*[@text="Edit debt"]    timeout=3s    error=Edit debt page should be visible.
    Input Text After It Is Visible    id=description_edit_text    Car loan
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Debt"]    timeout=3s    error=Debt page should be visible.
    Wait Until Element Is Visible On Page    //*[@text="Car loan"]    timeout=3s    error="Car loan" should be visible.

*** Keywords ***
Create A New Debt
    [Arguments]    ${description}
    Click Element After It Is Visible    //*[@text="Debts"]
    Wait Until Element Is Visible On Page    //*[@text="Debts"]    timeout=3s    error=Debts page should be visible.
    Click Element After It Is Visible    id=floating_action_button
    Wait Until Element Is Visible On Page    //*[@text="New debt"]    timeout=3s    error=New debt page should be visible.
    Input Text After It Is Visible    id=description_edit_text    ${description}
    Click Element After It Is Visible    id=action_save_changes
    ${dialogTitle} =    Get Text After It Is Visible    id=md_title
    Should Be Equal    Well done    ${dialogTitle}
    ${dialogContent} =    Get Text After It Is Visible    id=md_content
    Should Be Equal    Do you want to add a master transaction for this debt?    ${dialogContent}
    Click Element After It Is Visible    //*[@text="CANCEL"]
    Wait Until Element Is Visible On Page    //*[@text="Debts"]    timeout=3s    error=Debts page should be visible.
    Wait Until Element Is Visible On Page    //*[@text="${description}"]    timeout=3s    error="${description}" should be visible.