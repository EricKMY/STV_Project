*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Suite Setup    Run Keywords    Open App
...                     AND    Create Wallet
...                     AND    Update Currencey Rate
Test Teardown    Go Back To Primary Page
Suite Teardown    Run Keywords    Click Element After It Is Visible    //*[@content-desc="Open"]
...                        AND    Wait Until Element Is Visible On Page    //*[@text="Settings"]    timeout=3s    error=Settings page should be visible.
...                        AND    Swipe    0    200    0    1200
...                        AND    Delete Wallet
...                        AND    Close Application

*** Test Cases ***
Convert USD to TWD
    Go To Currency Converter Page
    Select "Currency From" USD
    "Currency From" Should Be USD
    Select "Currency To" TWD
    "Currency To" Should Be TWD
    Input Converting Dollar
    Converted Result Should Be As Expected

Convert USD to TWD with huge amount
    Go To Currency Converter Page
    Select "Currency From" USD
    "Currency From" Should Be USD
    Select "Currency To" TWD
    "Currency To" Should Be TWD
    Input Large Converting Dollar
    Large Converted Result Should Be As Expected

*** Keywords ***
Update Currencey Rate
    Swipe    0    1200    0    200
    Click Element After It Is Visible    //*[@text="Settings"]
    Wait Until Element Is Visible On Page    //*[@text="Settings"]    timeout=3s    error=Settings page should be visible.
    Click Element After It Is Visible    //*[@text="Utilities"]
    Click Element After It Is Visible    //*[@text="Custom api-key"]
    Wait Until Element Is Visible On Page    //*[@text="Custom api-key"]    timeout=3s    error=Custom api-key Page should be visible.
    ${dialogContent} =    Get Text    id=md_content
    Should Be Equal    This service requires a valid api-key in order to work. This means that this application release was compiled without a default key, probably due to licensing issues. To be able to communicate with this external provider you must go to https://openexchangerates.org and register: you will receive a free key.    ${dialogContent}
    Input Text After It Is Visible    //*[@text="Insert api-key"]    30f9d1d33efa4e9483a7cbe06864de96
    Click Element After It Is Visible    id=md_buttonDefaultPositive
    Wait Until Element Is Visible On Page    //*[@text="Utilities"]    timeout=3s    error=Utilities page should be visible.
    Click Element After It Is Visible    //*[@text="Update exchange rates"]
    Go Back To Secondary Page

Go To Currency Converter Page
    Click Element After It Is Visible    //*[@content-desc="Open"]
    Click Element After It Is Visible    //*[@text="Converter"]
    Wait Until Element Is Visible On Page    //*[@text="Currency converter"]    timeout=3s    error=Currency converter page should be visible

Select "Currency From" USD
    Click Element After It Is Visible    id=currency_from
    Wait Until Element Is Visible On Page    //*[@text="Currencies"]    timeout=3s    error=Currencies page should be visible
    Scroll Down Until Element Is Visible    //*[@text="US Dollar"]
    Click Element After It Is Visible    //*[@text="US Dollar"]
    Wait Until Element Is Visible On Page    //*[@text="Currency converter"]    timeout=3s    error=Currency converter page should be visible

"Currency From" Should Be USD
    ${currencyFrom} =    Get Text    id=text_currency_from
    Should Be Equal    USD    ${currencyFrom}

Select "Currency To" TWD
    Click Element After It Is Visible    id=currency_to
    Wait Until Element Is Visible On Page    //*[@text="Currencies"]    timeout=3s    error=Currencies page should be visible
    Scroll Down Until Element Is Visible    //*[@text="New Taiwan Dollar"]
    Click Element After It Is Visible    //*[@text="New Taiwan Dollar"]
    Wait Until Element Is Visible On Page    //*[@text="Currency converter"]    timeout=3s    error=Currency converter page should be visible

"Currency To" Should Be TWD
    ${currencyTo} =    Get Text    id=text_currency_to
    Should Be Equal    TWD    ${currencyTo}

Input Converting Dollar
    Click Element After It Is Visible    id=keyboard_button_1
    ${currencyAmountFrom} =    Get Text    id=money_currency_from
    Should Be Equal    1    ${currencyAmountFrom}

Converted Result Should Be As Expected
    ${currencyAmountTo} =    Get Text    id=money_currency_to
    Should Match Regexp    ${currencyAmountTo}    (28|29|30|31|32).\\d\\d

Input Large Converting Dollar
    Click Element After It Is Visible    id=keyboard_button_1
    :FOR    ${i}    IN RANGE    18
    \    Click Element After It Is Visible    id=keyboard_button_0
    ${currencyAmountFrom} =    Get Text    id=money_currency_from
    Should Be Equal    1000000000000000000    ${currencyAmountFrom}

Large Converted Result Should Be As Expected
    ${currencyAmountTo} =    Get Text    id=money_currency_to
    Should Match Regexp    ${currencyAmountTo}    (28|29|30|31|32),\\d\\d\\d,\\d\\d\\d,\\d\\d\\d,\\d\\d\\d,\\d\\d\\d,\\d\\d\\d.\\d\\d