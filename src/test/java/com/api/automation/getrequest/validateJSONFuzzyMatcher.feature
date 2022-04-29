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
    And match response.[0].jobId == '#present'
    And match response.[0].experience[1] == '#string'
    And match response.[0].project[0].projectName == '#notnull'
    And match response.[0].project[0].technology == '#array'
    #comples fuzzy matcher 
    And match response.[0].jobId == '#? _ >= 1'
    And match response.[0].jobTitle == '#string? _.length == 13'
    #Make sure that the below property or key is not present
    And match response.[0].empID == '#notpresent'
    #To validate the array or that its array type
    And match response.[0].experience == '#[]'
    #To validate the size of the array
    And match response.[0].experience == '#[3]'
    #Make sure its array of strings
    And match response.[0].experience == '#[3] #string'
    #make sure its array of strings and length of each string is greater than 2
    And match response.[0].experience == '#[3] #string? _.length>=2'
 