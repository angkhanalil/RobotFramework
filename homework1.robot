*** Settings ***
Resource    my_keyword.robot


*** Test Cases ***
Found data from google with Keyword robot
    เปิด browser เพื่อเข้าใช้งาน
    #เปิด Dialog upload file
    Choose 3 files
    Validate data after choosed 3 files
    # Upload and Validate progress of first file
    # Upload and Validate progress of second file
    # Upload and Validate progress of third file

    Upload file 1 and check upload progress 33%    #    embeded

    #[Use Arguments]
    Upload and Validate progress    1    33
    my_keyword.Upload and Validate progress    2    67
    my_keyword.Upload and Validate progress    3    100
