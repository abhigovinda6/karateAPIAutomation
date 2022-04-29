Feature: To test the get end point of the application with JSON path expression

  Background: Set up base path
    Given url 'http://localhost:9897'

  Scenario: To get all the data from application in JSON format validate with JSON path expression
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
    # karate.jsonPath(doc,jsonPathExpression)
    * def jid = 1
    * def jobTitle = karate.jsonPath(response,"$[?(@.jobId==" + jid + ")].jobTitle")
    * def jobDescription = karate.jsonPath(response,"$[?(@.jobId==1)].jobDescription")
    * def technology = karate.jsonPath(response,"$[?(@.jobId==1)]..technology")
    And print "The job title is=> ",jobTitle
    And print "The job description is=> ",jobDescription
    And print "The technology is=> ",technology