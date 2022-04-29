@Regression @Confidence
Feature: To test the get endpoint with the query parameter
       GET /normal/webapi/find

  Background: Set up and initialize base url
    Given url 'http://localhost:9897'

  Scenario: To get the data using query parameter
    # Create the job entry
    # Get the newly added job entry using query parameters
    * def randomeValue = function() {return Math.floor((100) * Math.random());}
    * def createJobid = randomeValue()
    * def createJob = call read("../createJobEntry2.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobid)'}
    # Send the get request with query parameter
    Given path '/normal/webapi/find'
    # And param id = createJobid
    # And param jobTitle = 'Software Engg 3'
    And params {id: '#(createJobid)',jobTitle:'Software Engg 3'}
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.jobId == createJobid

    Scenario: To get the data using query parameter where job id not in application
    # Create the job entry
    # Get the newly added job entry using query parameters
    * def randomeValue = function() {return Math.floor((100) * Math.random());}
    * def createJobid = randomeValue()
    * def createJob = call read("../createJobEntry2.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobid)'}
    # Send the get request with query parameter
    Given path '/normal/webapi/find'
    And param id = 34567
    And param jobTitle = 'Software Engg 3'
    # And params {id: '#(createJobid)',jobTitle:'Software Engg 3'}
    And header Accept = 'application/json'
    When method get
    Then status 404
   
    