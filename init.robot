*** Settings ***
Library    AppiumLibrary

*** Test Cases ***
test
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=7.1.1
    ...    deviceName=Pixel 2 API 25    app=C:\\Users\\lab1321\\Desktop\\moneywallet\\app\\proprietaryOsm\\release\\app-proprietary-osm-release.apk    appPackage=com.oriondev.moneywallet
    Sleep    2s
    Click First Time Button
    Sleep    1s
    Click Element    id=next
    Sleep    1s
    Click Element    id=next
    Sleep    1s
    Click Element    id=next
    Sleep    1s
    Click Element    id=next
    Sleep    1s
    Click Element    id=done

*** Keywords ***
Click First Time Button
    Click Element    id=first_start_button