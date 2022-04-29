Feature: To test the get end point of the application
  To test different get end point with different formats supported by the application

  Background: Set up base path
    Given url 'http://localhost:9897'

  Scenario: To get all the data from application in JSON format and validate response using XML
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
    And print response
    And match response/List/item/jobId == '1'
    And match response/List/item/experience//experience[1] == 'Google'
    And match response/List/item/project/project/projectName == 'Movie App'
    And match response/List/item/project/project/technology//technology[2] == 'SQL Lite'

  Scenario: To get all the data from application in JSON format and validate response using XML
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
    And print response
    And match response.List.item.jobId == '1'
    And match response.List.item.experience.experience[0] == 'Google'
    And match response.List.item.project.project.projectName == 'Movie App'
    And match response.List.item.project.project.technology.technology[1] == 'SQL Lite'
