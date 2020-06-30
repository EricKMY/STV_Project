*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open App
...                    AND    Create Wallet
Test Teardown    Run Keywords    Go Back To Primary Page
...                       AND    Go Back To Secondary Page
...                       AND    Click Element After It Is Visible    //*[@content-desc="Open"]
...                       AND    Wait Until Element Is Visible On Page    //*[@text="Settings"]    timeout=3s    error=Settings page should be visible.
...                       AND    Swipe    0    200    0    1200
...                       AND    Delete Wallet
...                       AND    Close Application

*** Test Cases ***
Export data
    Swipe    0    1200    0    200
    Click Element After It Is Visible    //*[@text="Settings"]
    Wait Until Element Is Visible On Page    //*[@text="Settings"]    timeout=3s    error=Settings page should be visible.
    Click Element After It Is Visible    //*[@text="Database"]
    Wait Until Element Is Visible On Page    //*[@text="Database"]    timeout=3s    error=Database page should be visible.
    Click Element After It Is Visible    //*[@text="Export data"]
    Click Element After It Is Visible    id=export_format_edit_text
    Wait Until Element Is Visible On Page    //*[@text="Data format"]    timeout=3s    error=Data format dialog should be visible.
    Click Element After It Is Visible    //*[@text="CSV"]
    Click Element After It Is Visible    id=wallets_edit_text
    Click Element After It Is Visible    //*[@text="Living Expenses"]
    Click Element After It Is Visible    //*[@text="OK"]
    Click Element After It Is Visible    id=export_folder_edit_text
    ${warningMsg} =    Set Variable    Allow MoneyWallet to access photos, media, and files on your device?
    Wait Until Element Is Visible On Page    //*[@text="${warningMsg}"]    timeout=3s    error=Warning dialog should be visible.
    Click Element After It Is Visible    //*[@text="ALLOW"]
    Click Element After It Is Visible    //*[@text="Download"]
    Click Element After It Is Visible    id=action_select_folder
    Wait Until Element Is Visible On Page    //*[@text="Export data"]    timeout=3s    error=Export data page should be visible.
    Click Element After It Is Visible    id=action_export_data
    ${dialogTitle} =    Get Text After It Is Visible    id=md_title
    Should Be Equal    Success    ${dialogTitle}
    ${dialogContent} =    Get Text After It Is Visible    id=md_content
    Should Be Equal    Data exported correctly. Do you want to open the created file?    ${dialogContent}
    Click Element After It Is Visible    //*[@text="CANCEL"]