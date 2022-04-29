Feature: To test the delete end point
    DELETE /normal/webapi/remove/{id}

  Background: To create an initialize base URL
    Given url 'http://localhost:9897'

  Scenario: To delete job entry from application using job id
    # Create a new job entry
    # Delete the new created job entry
    # Get request with query parameter for the job id deleted and validate 404
    * def randomeValue = function() {return Math.floor((100) * Math.random());}
    * def createJobid = randomeValue()
    * def createJob = call read("../createJobEntry2.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobid)'}
    # delete request
    Given path  '/normal/webapi/remove/' + createJobid
    And header Accept = 'application/json'
    When method delete
    Then status 200
    # Get request with query parameter
    Given path '/normal/webapi/find'
    And params {id:'#(createJobid)',jobTitle:'Software Engg 3'}
    And header Accept = 'application/json'
    When method get
    Then status 404

  Scenario: To delete job entry from application using job id and delete the job entry twice
    # Create a new job entry
    # Delete the new created job entry
    # Get request with query parameter for the job id deleted and validate 404
    * def randomeValue = function() {return Math.floor((100) * Math.random());}
    * def createJobid = randomeValue()
    * def createJob = call read("../createJobEntry2.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobid)'}
    # delete request
    Given path  '/normal/webapi/remove/' + createJobid
    And header Accept = 'application/json'
    When method delete
    Then status 200
    # delete request
    Given path  '/normal/webapi/remove/' + createJobid
    And header Accept = 'application/json'
    When method delete
    Then status 404

    Scenario: To demo request chaining
    # Create a new job entry
    # Extract the jobId and Job Title from the response of this request 
    # Send the patch request the value of query parameter will be set by information we extracted from post request
    # Extract jobId and JobTitle from response of patch request
    # Get request with query parameter, value of query parameter is set by information extracted from patch request
    * def randomeValue = function() {return Math.floor((100) * Math.random());}
    * def createJobid = randomeValue()
    * def createJob = call read("../createJobEntry3.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobid)'}
    * def jobId = createJob.responseJobId
    * def jobTitle = createJob.responseJobTitle
    # Patch request
    * def jobDesc = 'To develop andriod application and IOS application'
    Given path '/normal/webapi/update/details'
    And header Accept = 'application/json'
    And params {id:'#(jobId)',jobTitle:'#(jobTitle)',jobDescription:'#(jobDesc)'}
    And request {}
    When method patch 
    Then status 200
    * def jobIdResponse = response.jobId
    * def jobTitleResponse = response.jobTitle
    # Get request
    Given path '/normal/webapi/find'
    And header Accept = 'application/json'
    And params {id:'#(jobIdResponse)',jobTitle:'#(jobTitleResponse)'}
    When method get
    Then status 200
    And match response.jobDescription == jobDesc
    
    
    