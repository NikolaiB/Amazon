*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/utils.robot

*** Variables ***
${browser}        chrome
${url}            https://www.amazon.com/

*** Test Cases ***
Add Two Items To A Cart
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    ${SEARCH_FIELD}    bose headphone
    Robust Click    ${SEARCH_BUTTON}
    Wait Until Element Is Enabled    ${SORT_BY_DROPDOWN}
    Select From List By Label    ${SORT_BY_DROPDOWN}    Price: High to Low
    Add The Item To Cart    1
    Input Text    ${SEARCH_FIELD}    bose headphone
    Robust Click    ${SEARCH_BUTTON}
    Wait Until Element Is Enabled    ${SORT_BY_DROPDOWN}
    Select From List By Label     ${SORT_BY_DROPDOWN}    Price: High to Low
    Add The Item To Cart    2
    Observe Items In Cart    2
    Close All Browsers

*** Keywords ***
Add The Item To Cart
    [Arguments]    ${item_number}
    Robust Click    (//div[@class='a-section a-spacing-medium']//a[@class='a-link-normal a-text-normal'])[${item_number}]
    Robust Click    id:add-to-cart-button
    Wait Until Element Is Visible    //h1[starts-with(normalize-space(),'Added to Cart')]

Observe Items In Cart
    [Arguments]    ${ammount_of_items}
    Robust Click    ${CART}
    Wait Until Element Is Visible    //div[@class='a-fixed-right-grid-col a-col-right']//span[starts-with(normalize-space(),'Subtotal (${ammount_of_items} items)')]
