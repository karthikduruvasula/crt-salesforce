*** Settings ***
Resource          ../resources/common.robot
Suite Setup       Login To Salesforce
Suite Teardown    End Test Session

*** Test Cases ***
Manage Account Lifecycle
    [Documentation]    Test Flow: Create -> Edit -> Delete Account
    
    [Tags]             Salesforce_UI_Test
    
    # 1. CREATE ACCOUNT
    LaunchApp          Sales
    ClickText          Accounts
    ClickText          New
    # QWeb finds fields by their label names automatically
    TypeText           Account Name    ${ACCOUNT_NAME_VAL}
    TypeText           Phone           ${PHONE_VAL}
    ClickText          Save            partial_match=False
    VerifyText         Account "${ACCOUNT_NAME_VAL}" was created.
    
    # 2. EDIT ACCOUNT
    ClickText          Edit
    TypeText           Account Name    ${EDITED_NAME_VAL}
    ClickText          Save
    VerifyText         Account "${EDITED_NAME_VAL}" was saved.
    
    # 3. DELETE ACCOUNT
    ClickText          Show more actions    # The down arrow icon in SF
    ClickText          Delete
    # Confirm the deletion in the popup modal
    ClickElement       xpath=//button[@title\='Delete']
    VerifyText         Account "${EDITED_NAME_VAL}" was deleted.