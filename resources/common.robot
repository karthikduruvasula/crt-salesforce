# Setup, Teardown, and Login logic

*** Settings ***
Library        QWeb
Resource       locators.robot

*** Keywords ***
Login To Salesforce
    [Documentation]    Logs into the Salesforce Sandbox
    OpenBrowser       about:blank    ${browser}
    GoTo              ${login_url}
    # These variables come from your CRT Parameters/Vault
    TypeText          ${USER_FIELD}    ${username}
    TypePassword      ${PASS_FIELD}    ${password}
    ClickText         ${LOGIN_BTN}
    # Check for successful login by verifying the 'Home' text
    VerifyText        Home    timeout=30s

LaunchApp
    [Arguments]       ${appName}
    [Documentation]   Opens the Salesforce App Launcher and searches for the app
    ClickText         App Launcher            # This clicks the 9-dot 'Waffle' icon
    TypeText          Search apps and items...    ${appName}
    # Click the specific app result from the dropdown
    ClickText         ${appName}    anchor=Apps
    # Optional: Wait for the page to transition
    VerifyText        ${appName}    timeout=15s
    
End Test Session
    CloseBrowser