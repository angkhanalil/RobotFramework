*** Settings ***
Library     SeleniumLibrary
Library     String


*** Variables ***
${MY_URL}           https://www.google.com/
${MY_BROWSER}       gc


*** Test Cases ***
Found data from google with Keyword robot
    เปิด browser เพื่อเข้าใช้งาน google.com
    ทำการค้นหาด้วยคำว่า robot
    ต้องเจอข้อมูลของ robot


*** Keywords ***
เปิด browser เพื่อเข้าใช้งาน google.com
    Open Browser    ${MY_URL}    browser=${MY_BROWSER}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window

ทำการค้นหาด้วยคำว่า robot
    Wait Until Element Is Enabled    name:q
    Input Text    name:q    robot
    Press Keys    name:q    RETURN

ต้องเจอข้อมูลของ robot
    Wait Until Page Contains    robot
    Wait Until Element Contains    id:result-stats    About

    ${data}=    Get Text    id:result-stats
    Log To Console    ${data}

    ${word}=    Split String    ${data}    ${SPACE}    3
    Log To Console    \n${word[0]}
    Log To Console    \n${word[1]}

    Should Be Equal    About    ${word[0]}
