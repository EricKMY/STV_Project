*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open App
...                    AND    Create Wallet
...                    AND    Create A New Saving    Pocket money
Test Teardown    Run Keywords    Click Element After It Is Visible    //*[@content-desc="Open"]
...                       AND    Delete Wallet
...                       AND    Close Application

*** Test Cases ***
Delete a Saving
    Click Element After It Is Visible    //*[@text="Pocket money"]
    Wait Until Element Is Visible On Page    //*[@text="Saving"]    timeout=3s    error=Saving page should be visible.
    Click Element After It Is Visible    //*[@content-desc="More options"]
    Click Element After It Is Visible    //*[@text="Delete"]
    ${dialogTitle} =    Get Text After It Is Visible    id=md_title
    Should Be Equal    Warning    ${dialogTitle}
    ${dialogContent} =    Get Text After It Is Visible    id=md_content
    Should Be Equal    Are you sure you want to delete this saving? All the related data will be removed.    ${dialogContent}
    Click Element After It Is Visible    //*[@text="OK"]
    Wait Until Element Is Visible On Page    //*[@text="Savings"]    timeout=3s    error=Savings page should be visible.
    Page Should Not Contain Element    //*[@text="Pocket money"]

*** Keywords ***
Create A New Saving
    [Arguments]    ${description}
    Click Element After It Is Visible    //*[@text="Savings"]
    Wait Until Element Is Visible On Page    //*[@text="Savings"]    timeout=3s    error=Savings page should be visible.
    Click Element After It Is Visible    id=floating_action_button
    Wait Until Element Is Visible On Page    //*[@text="New saving"]    timeout=3s    error=New saving page should be visible.
    Input Text After It Is Visible    id=description_edit_text    ${description}
    Click Element After It Is Visible    id=action_save_changes
    Wait Until Element Is Visible On Page    //*[@text="Savings"]    timeout=3s    error=Savings page should be visible.
    Wait Until Element Is Visible On Page    //*[@text="${description}"]    timeout=3s    error="${description}" should be visible.