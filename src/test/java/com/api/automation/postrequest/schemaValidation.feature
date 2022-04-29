Feature: To validate JSON schema
   To Validate the JSON schema for Post /normal/webapi/add

  Background: Create and Initialize base URL
    Given url 'http://localhost:9897'

  Scenario: To validate schema in JSON format
    Given path '/normal/webapi/add'
    * def body = read("date/jobentry.json")
    And request body
    And headers {Accept : 'application/json',Content-Type : 'application/json'}
    When method post
    Then status 201
    And match response ==
      """
      {
      "jobId": '#number',
      "jobTitle": '#string',
      "jobDescription": '#string',
      "experience": '#[] #string',
      "project": '#[] #object'
      }

      """

  Scenario: To get all the data from application in JSON format and perform schema validation for get endpoint
    #Given url 'http://localhost:9897/normal/webapi/all'
    Given path '/normal/webapi/all'
    When method get # Send the get request
    Then status 200 # the status code response should be 200
    * def projectSchema = {"projectName": '#string',"technology": '#[] #string'}
    * def mainSchema = {"jobId": '#number',"jobTitle": '#string',"jobDescription": '#string',"experience":'#[] #string',"project": '#[] ##(projectSchema)'}
    And match response ==
    """
     '#[] ##(mainSchema)'
    """