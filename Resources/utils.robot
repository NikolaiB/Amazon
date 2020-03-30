*** Settings ***
Library     SeleniumLibrary

*** Variable ***
#
# Here will be different resource viriables
#
# Timeouts
#
${TIMEOUT_0}      0s
${TIMEOUT_1}      1s
${TIMEOUT_3}      3s
${TIMEOUT_5}      5s
${TIMEOUT_10}     10s
${TIMEOUT_15}     15s
#
# Global variables
#
${SEARCH_FIELD}    id:twotabsearchtextbox
${SEARCH_BUTTON}    //div[@class='nav-search-submit nav-sprite']
${SORT_BY_DROPDOWN}    id:s-result-sort-select
${CART}    id:nav-cart

*** Keywords ***
Robust Click
    [Arguments]    ${locator}    ${type}=element
    [Documentation]    *Description*
    ...
    ...    Waits for the presence of an element identified by ${locator} before clicking on the it.
    ...    This keyword is more robust to unpredictable page loading times.
    ...
    ...    *Arguments*
    ...
    ...    - _locator_ - locator of the element to be clicked.
    ...    - _type_ - a type of the element. Possible values: link, image, button, element. Default is element.
    ...
    ...    *Return Values*
    ...
    ...    None
    ...
    ...    *Preconditions*
    ...
    ...    None
    ...
    ...    *Example*
    ...
    ...    | Robust Click | //input | button |
    Wait Until Page Contains Element    ${locator}    ${TIMEOUT_15}
    Wait Until Keyword Succeeds    ${TIMEOUT_10}    ${TIMEOUT_1}    Scroll Element Into View    ${locator}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT_3}
    ${disabled}=    Get Element Attribute    ${locator}    disabled
    Run Keyword If    '${disabled}' == 'true'    Capture Page Screenshot
    Run Keyword If    '${disabled}' == 'true'    Fail    msg=Cannot click '${locator}' element as it is disabled
    Run Keyword If    '${type}'=='link'    Wait Until Keyword Succeeds    ${TIMEOUT_10}    ${TIMEOUT_1}    Click Link    ${locator}
    Run Keyword If    '${type}'=='image'    Wait Until Keyword Succeeds    ${TIMEOUT_10}    ${TIMEOUT_1}    Click Image    ${locator}
    Run Keyword If    '${type}'=='button'    Wait Until Keyword Succeeds    ${TIMEOUT_10}    ${TIMEOUT_1}    Click Button    ${locator}
    Run Keyword If    '${type}'=='element'    Wait Until Keyword Succeeds    ${TIMEOUT_10}    ${TIMEOUT_1}    Click Element    ${locator}