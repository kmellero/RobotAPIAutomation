*** Settings ***
Library  RequestsLibrary


*** Variables ***
# http://thetestingworldapi.com/api/studentsDetails
${Base_URL}  http://thetestingworldapi.com/
${URI}  api/studentsDetails

*** Test Cases ***
TC_001_GET_Request
    Create Session  Get_Student_Details  ${Base_URL}
    ${response}=  Get Request  Get_Student_Details  ${URI}
    log to console  ${response.status_code}
    log to console  ${response.content}


