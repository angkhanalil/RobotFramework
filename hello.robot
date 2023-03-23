*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Found data from google with Keyword robot
    เปิด browser เพื่อเข้าใช้งาน google.com
    ทำการค้นหาด้วยคำว่า robot
    ต้องเจอข้อมูลของ robot


*** Keywords ***
เปิด browser เพื่อเข้าใช้งาน google.com
    Open Browser    https://www.google.com/    browser=gc
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window

ทำการค้นหาด้วยคำว่า robot
    Wait Until Element Is Enabled    name:q
    Input Text    name:q    robot
    Press Keys    name:q    RETURN

ต้องเจอข้อมูลของ robot
    Wait Until Page Contains    robot
    Wait Until Element Contains    id:result-stats    About
