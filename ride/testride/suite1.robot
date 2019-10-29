*** Settings ***
Library           DateTime
Library           OperatingSystem

*** Variables ***
${pos}            2019-01-01    # so lan test

*** Test Cases ***
test1
    ${pos}    Add Time To Date    ${pos}    1d
    Comment    Set Environment Variable    count    1
    Comment    ${count}    Get Environment Variable    count
    ${content}    Get File    /Users/debug/.robot
    ${count}    Convert To Integer    ${content}
    ${count}    Evaluate    ${count}+1
    ${pos}    Add Time To Date    ${pos}    ${count}d
    Set Environment Variable    count    ${count}
    ${count}    Get Environment Variable    count
    Create File    /Users/debug/.robot    ${count}
    ${content}    Get File    /Users/debug/.robot
    Log    ${content}
    Log    ${pos}
