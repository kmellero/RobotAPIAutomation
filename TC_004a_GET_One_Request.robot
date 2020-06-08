*** Settings ***
Library  RequestsLibrary


*** Variables ***
${Base_URL}  http://thetestingworldapi.com/
${URI}  api/studentsDetails
#${student_id}  #to get new POSt id

*** Test Cases ***
TC_001_GET_Posted_New_Student_ID
    Create Session  Get_New_Student_ID  ${Base_URL}
    #the same POST body as in the POST test case, could pull it into common file
   &{body}=  Create Dictionary  first_name=Testing  middle_name=B  last_name=Universe  date_of_birth=12/09/2000
    &{header}=  Create Dictionary  Content-Type=application/json
    ${response}=  Get Request  Get_New_Student_ID  ${URI}  headers=${header}  data=${body}