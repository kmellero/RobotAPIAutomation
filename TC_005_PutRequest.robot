*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
# http://thetestingworldapi.com/api/studentsDetails
${Base_URL}  http://thetestingworldapi.com/
${URI}  api/studentsDetails

*** Test Cases ***
TC_005 Create New Resource and update it
    [Documentation]  update after the post, and get it
    Create Session  AppData  ${Base_URL}
    &{body}=  Create Dictionary  first_name=Tester  middle_name=X  last_name=Earth  date_of_birth=31/12/1999
    &{header}=  Create Dictionary  Content-Type=application/json
    ${response}=  Post Request  AppData  ${URI}  data=${body}  headers=${header}  #$ instead &, for just a name is passed
    ${code}=  Convert To String  ${response.status_code}
    Should Be Equal  ${code}  201
#   log to console  ${response.status_code}
    log to console  ${response.content}
    ${jsonresponse}=  To Json  ${response.content}
    @{id_list}=  Get Value From Json  ${jsonresponse}  $..id   #data[0].id
    ${id}=  Get From List  ${id_list}  0

# now update on obtained id
    &{body2}=  Create Dictionary  id=${id}  first_name=Tester  middle_name=534_u7  last_name=Earth  date_of_birth=31/12/1999
    &{param}=  Create Dictionary  id=${id}
    ${response2}=  Put Request  AppData  ${URI}  params=&{param}  data=${body2}  headers=${header}  #$ instead &, for just a name is passed
    ${code}=  Convert To String  ${response.status_code}
    Should Be Equal  ${code}  201

    ${response3}=  Get Request  AppData  ${URI}  params=&{param}
    log to console  ${response3.content}
