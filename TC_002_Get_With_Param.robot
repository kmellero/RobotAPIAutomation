*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_URL}  https://reqres.in
${URI}  /api/users/

*** Test Cases ***
TC_002 Validate Get Request with Parameters
    Create Session  Get_Param  ${Base_URL}
    &{param}=  Create Dictionary  page=2
    ${response}=  Get Request  Get_Param  ${URI}  params=${param}
    ${statuscode}=  Convert To String  ${response.status_code}
    Should Be Equal  ${statuscode}  200
    ${jsonresponse}=  To Json  ${response.content}
    @{name_list}=  Get Value From Json  ${jsonresponse}  data[0].first_name
    ${name}=  Get From List  ${name_list}  0
    Should Be Equal  ${name}  Michael

    @{ids}=  Get Value From Json  ${jsonresponse}  $..id
    @{fn}=  Get Value From Json  ${jsonresponse}  $..first_name
    @{ln}=  Get Value From Json  ${jsonresponse}  $..last_name
    &{di}=  Create Dictionary  id  ${ids}[0]  first_name  ${fn}[0]  last_name  ${ln}[0]
    log to console  ${ids}
    log to console  ${fn}
    FOR  ${i}  IN  ${jsonresponse}
      log to console  ${i}
      Run Keyword IF  ${i} == 'Michael'  log to console  $..id  ELSE  log to console  noMicheal
    END


