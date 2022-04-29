Feature: To test the get end point of the application
  To test different get end point with different formats supported by the application

  Background: Set up base path
    Given url 'http://localhost:9897'

  Scenario: To get all the data from application in JSON format and validate response using JSON array
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
    And print response
    And match response.[0].jobId == 1
    And match response.[0].experience[1] == 'Apple'
    And match response.[0].project[0].projectName == 'Movie App'
    And match response.[0].project[0].technology[2] == 'Gradle'
    #validate the size of the array
    And match response.[0].experience == '#[3]'
    And match response.[0].project[0].technology == '#[3]'

  Scenario: To get all the data from application in JSON format and validate response using wild character JSON array
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
    And print response
    And match response.[0].experience[*] == ["Google","Apple","Mobile Iron"]
    And match response.[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"]

  Scenario: To get all the data from application in JSON format and validate response using wild character JSON array
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
    And print response
    And match response.[0].experience[*] contains ["Apple","Mobile Iron"]
    And match response.[0].project[0].technology[*] contains ["SQL Lite"]
