*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
# http://thetestingworldapi.com/api/studentsDetails
${Base_URL}  http://thetestingworldapi.com/
${URI}  api/studentsDetails/?id=269187  #191054, check for available id

*** Test Cases ***
TC_004 Validate Delete Request
    Create Session  AppAccess  ${Base_URL}
    ${response}=  Delete Request  AppAccess  ${URI}
    ${code}=  Convert To String  ${response.status_code}
    Should Be Equal  ${code}  200
    ${jsonresponse}=  to json  ${response.content}
    ${status_list}=  Get Value From Json  ${jsonresponse}  status
    ${status}=  Get From List  ${status_list}  0
    Should Be Equal  ${status}  true