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

End Test Session
    CloseBrowser