Feature: To access GET endpoint which is secure with Baisc Auth
       GET /secure/webapi/all

  Background: Set up and initialize the base URL
    Given url 'http://localhost:9897/'

  Scenario: To access GET endpoint with Basic Auth
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json', Authorization:'Basic YWRtaW46d2VsY29tZQ=='}
    When method get
    Then status 200
    And match response == '#notnull'

  Scenario: To access GET endpoint with Basic Auth and without Authroization in header
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json'}
    When method get
    Then status 401
    And match response == '#notnull'

  Scenario: To access GET endpoint with Basic Auth and with non-existing user
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json', Authorization:'Basic YXV0aG9yOndlbGNvbWUx'}
    When method get
    Then status 401
    And match response == '#notnull'

    
  Scenario: To access GET endpoint with Basic Auth via js function
    Given path '/secure/webapi/all'
    * def auth = call read('../../basicAuth.js')  {username:'admin', password:'welcome'}
    And print "Encoded string is => ", auth
    And headers {Accept:'application/json', Authorization:'#(auth)'}
    When method get
    Then status 200
    And match response == '#notnull'