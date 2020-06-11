*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open App
...                    AND    Create Wallet
...                    AND    Create A New Debt    Home loan
Test Teardown    Run Keywords    Click Element After It Is Visible    //*[@content-desc="Open"]
...                       AND    Delete Wallet
...                       AND    Close Application

*** Test Cases ***
Delete a Debt
    Click Element After It Is Visible    //*[@text="Home loan"]
    Wait Until Element Is Visible On Page    //*[@text="Debt"]    timeout=3s    error=Debt page should be visible.
    Click Element After It Is Visible    //*[@content-desc="More options"]
    Click Element After It Is Visible    //*[@text="Delete"]
    ${dialogTitle} =    Get Text After It Is Visible    id=md_title
    Should Be Equal    Warning    ${dialogTitle}
    ${dialogContent} =    Get Text After It Is Visible    id=md_content
    Should Be Equal    Are you sure you want to delete this debt? All the related data will be removed.    ${dialogContent}
    Click Element After It Is Visible    //*[@text="OK"]
    Wait Until Element Is Visible On Page    //*[@text="Debts"]    timeout=3s    error=Debts page should be visible.
    Page Should Not Contain Element    //*[@text="Home loan"]

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