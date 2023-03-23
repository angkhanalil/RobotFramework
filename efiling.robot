*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Found data from google with Keyword robot
    เปิด browser เพื่อเข้าใช้งาน efiling.com
    แสดง announce
    ทำการ Login เข้าระบบ


*** Keywords ***
เปิด browser เพื่อเข้าใช้งาน efiling.com
    Open Browser    https://efiling.rd.go.th/rd-cms/    browser=gc
    ...    options=add_experimental_option("detach", True)

แสดง announce
    Wait Until Element Contains    id:exampleModalLabel    แจ้งข่าวสาร
    Click Element    xpath://*[@id="announceModal"]/div/div/div[1]/button

ทำการ Login เข้าระบบ
    Wait Until Element Contains    xpath://*[@id="top"]/div/div[2]/button[1]/a    ยื่นแบบออนไลน์
    Click Element    xpath://*[@id="top"]/div/div[2]/button[1]/a

    Switch Window    NEW
    Wait Until Element Is Enabled    id:username
    Input Text    id:username    xxxxxx
