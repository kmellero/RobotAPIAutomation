*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
# http://thetestingworldapi.com/api/studentsDetails
${Base_URL}  http://thetestingworldapi.com/
${URI}  api/studentsDetails

*** Test Cases ***
TC_004 Create New Resource
    Create Session  AppData  ${Base_URL}
    &{body}=  Create Dictionary  first_name=Testing  middle_name=B  last_name=Universe  date_of_birth=12/09/2000
    &{header}=  Create Dictionary  Content-Type=application/json
    ${response}=  Post Request  AppData  ${URI}  data=${body}   headers=${header}  #$ instead &, for just a name is passed
    ${code}=  Convert To String  ${response.status_code}
    Should Be Equal  ${code}  201
#   log to console  ${response.status_code}
#   log to console  ${response.content}