Feature: To test the get end point of the application
  To test different get end point with different formats supported by the application

  Background: Set up base path
    Given url 'http://localhost:9897'
    And print '*******This is background*********'

  Scenario: To get all the data from application in JSON format
    #Given url 'http://localhost:9897/normal/webapi/all'
    Given path '/normal/webapi/all'
    When method get # Send the get request
    Then status 200 # the status code response should be 200

  Scenario: To get all the data from application in JSON format using path variable
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200

  Scenario: To get all the data from application in xml format using header keyword
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
@ignore
  Scenario: To get all the data from application in JSON format using header keyword
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/json'  
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
