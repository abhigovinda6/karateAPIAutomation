Feature: To use embedded expression
   Use Post /normal/webapi/add to create resource with embedded expression

  Background: Create and Initialize base URL
    Given url 'http://localhost:9897'

  Scenario: To create job entry in JSON format with embedded expression
    Given path '/normal/webapi/add'
    * def getJobId = function() {return Math.floor((100) * Math.random());}
    * def jobID = getJobId()
    And request {"jobId":'#(jobID)',"jobTitle":"Software Engg 3","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]},{"jobId":2,"jobTitle":"Business Analyst","jobDescription":"To develop andriod application","experience":["Google","Apple","Windows"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Selenium"]}]}
    And headers {Accept : 'application/json',Content-Type : 'application/json'}
    When method post
    Then status 201
    And print response
    And match response.jobId == '#(jobID)'

    
  