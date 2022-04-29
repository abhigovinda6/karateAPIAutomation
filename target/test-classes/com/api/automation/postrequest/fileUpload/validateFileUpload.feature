Feature: To test file upload with POST karate framework

  Background: Set up base path
    Given url 'http://localhost:9897'

  Scenario: To test file upload with POST
    #Given url 'http://localhost:9897'
    Given path '/normal/webapi/upload'
    # location of file, # name of file, # content-type header value
    And multipart file file = { read:'fileUpload.txt', filename:'fileUpload.txt', Content-Type:'multipart/form-data' }
    When method post
    Then status 200
    And print response

  Scenario: To test file upload with POST
    #Given url 'http://localhost:9897'
    Given path '/normal/webapi/upload'
    # location of file, # name of file, # content-type header value
    * def location = '../date/jobentry.json'
    And multipart file file = { read:'#(location)', filename:'jobentry.json', Content-Type:'multipart/form-data' }
    When method post
    Then status 200
    And print response
    And match response.message contains 'jobentry.json'
