Feature: To test the get end point of the application
  To test different get end point with different formats supported by the application

  Background: Set up base path
    Given url 'http://localhost:9897'

  Scenario: To get all the data from application in JSON format using file
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
    # create a variable and store response
    * def expectedResponse = read("../JSONresponse.json")
    And print expectedResponse
    And match response == expectedResponse

  Scenario: To get all the data from application in xml format using file
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
    # create a variable and store response
    * def expectedResponse = read("../xmlResponse.xml")
    And print expectedResponse
    And match response == expectedResponse
