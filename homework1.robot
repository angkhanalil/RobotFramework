*** Settings ***
Library     SeleniumLibrary
Library     String


*** Variables ***
${MY_URL}           http://nervgh.github.io/pages/angular-file-upload/examples/simple/
${MY_BROWSER}       gc


*** Test Cases ***
Found data from google with Keyword robot
    เปิด browser เพื่อเข้าใช้งาน
    #เปิด Dialog upload file
    Choose 3 files
    Validate data after choosed 3 files
    # Upload and Validate progress of first file
    # Upload and Validate progress of second file
    # Upload and Validate progress of third file

    #[Use Arguments]
    Upload and Validate progress    1    33
    Upload and Validate progress    2    67
    Upload and Validate progress    3    100


*** Keywords ***
เปิด browser เพื่อเข้าใช้งาน
    Open Browser    ${MY_URL}    browser=${MY_BROWSER}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window

เปิด Dialog upload file
    Wait Until Page Contains Element    xpath://*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]
    Choose File    xpath://*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]    ${CURDIR}/testfile.png
    #Choose File    xpath://*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]    ${CURDIR}/testfile2.png
    #Choose File    xpath://*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]    ${CURDIR}/testfile3.png
    Wait Until Element Is Visible    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr/td[1]/strong
    ${data}=    Get Text    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr/td[1]/strong
    Log To Console    ${data}

Choose 3 files
    Choose File    xpath://div[1]/input[2]    ${CURDIR}/uploads/1.txt
    Choose File    xpath://div[1]/input[2]    ${CURDIR}/uploads/2.txt
    Choose File    xpath://div[1]/input[2]    ${CURDIR}/uploads/3.txt

Validate data after choosed 3 files
    ${data}=    Get Text    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/p
    Log To Console    ${data}
    ${word}=    Split String    ${data}    ${SPACE}    2
    Log To Console    \n${word[2]}
    Should Be Equal    3    ${word[2]}

Upload and Validate progress
    [Arguments]    ${row_no}    ${percent_of_progress}
    Wait Until Element Is Enabled    xpath://table/tbody/tr[${row_no}]/td[5]/button[1]
    #check error is not visible
    Wait Until Element Is Not Visible    xpath://table/tbody/tr[${row_no}]/td[4]/span[3]
    #click upload
    Click Element    xpath://table/tbody/tr[${row_no}]/td[5]/button[1]
    #check error is    visible after click upload
    Wait Until Element Is Visible    xpath://div[@style="width: ${percent_of_progress}%;"]
    Wait Until Element Is Visible    xpath://table/tbody/tr[${row_no}]/td[4]/span[3]

Upload and Validate progress of first file
    Wait Until Element Is Enabled    xpath://table/tbody/tr[1]/td[5]/button[1]
    #check error is not visible
    Wait Until Element Is Not Visible    xpath://table/tbody/tr[1]/td[4]/span[3]
    #click upload
    Click Element    xpath://table/tbody/tr[1]/td[5]/button[1]
    #check error is    visible after click upload
    Wait Until Element Is Visible    xpath://div[@style="width: 33%;"]
    Wait Until Element Is Visible    xpath://table/tbody/tr[1]/td[4]/span[3]

Upload and Validate progress of second file
    Wait Until Element Is Enabled    xpath://table/tbody/tr[2]/td[5]/button[1]
    Click Element    xpath://table/tbody/tr[2]/td[5]/button[1]
    Wait Until Element Is Visible    xpath://div[@style="width: 67%;"]

Upload and Validate progress of third file
    Wait Until Element Is Enabled    xpath://table/tbody/tr[3]/td[5]/button[1]
    Click Element    xpath://table/tbody/tr[3]/td[5]/button[1]
    Wait Until Element Is Visible    xpath://div[@style="width: 100%;"]
