Feature: To test patch endpoint for updating job description
       PATCH /normal/webapi/update/details

  Background: Set up and initialize base url
    Given url 'http://localhost:9897'

  Scenario: To update job description for newly added job entry using patch request
  # Create a new job entry
  # Using patch request update job description of newly created entry
  * def randomeValue = function() {return Math.floor((100) * Math.random());}
    * def createJobid = randomeValue()
    * def createJob = call read("../createJobEntry2.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobid)'}
  # patch request to update job description with query paramter jobId and jobTitle
  Given path '/normal/webapi/update/details'
  * def jobDesc = 'To develop andriod application and web application'
  And params {id:'#(createJobid)',jobTitle:'Software Engg 3',jobDescription:'#(jobDesc)'}
  # expects a request body so using empty body we are using query parameter to update information
  And request {}
  And header Accept = 'application/json'
  When method patch
  Then status 200
  And match response.jobDescription == jobDesc
  
  
   Scenario: To update job description for newly added job entry using patch request with non existing jobId
  # Create a new job entry
  # Using patch request update job description of newly created entry
  * def randomeValue = function() {return Math.floor((100) * Math.random());}
    * def createJobid = randomeValue()
    * def createJob = call read("../createJobEntry2.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobid)'}
  # patch request to update job description with query paramter jobId and jobTitle
  Given path '/normal/webapi/update/details'
  * def jobDesc = 'To develop andriod application and web application'
  And params {id:'123456',jobTitle:'Software Engg 3',jobDescription:'#(jobDesc)'}
  # expects a request body so using empty body we are using query parameter to update information
  And request {}
  And header Accept = 'application/json'
  When method patch
  Then status 404
  
  
  Scenario: To update job description for newly added job entry without jobTitle
  # Create a new job entry
  # Using patch request update job description of newly created entry
  * def randomeValue = function() {return Math.floor((100) * Math.random());}
    * def createJobid = randomeValue()
    * def createJob = call read("../createJobEntry2.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobid)'}
  # patch request to update job description with query paramter jobId and jobTitle
  Given path '/normal/webapi/update/details'
  * def jobDesc = 'To develop andriod application and web application'
  And params {id:'#(createJobid)',jobDescription:'#(jobDesc)'}
  # expects a request body so using empty body we are using query parameter to update information
  And request {}
  And header Accept = 'application/json'
  When method patch
  Then status 400
  And match response.message == "Required String parameter 'jobTitle' is not present"