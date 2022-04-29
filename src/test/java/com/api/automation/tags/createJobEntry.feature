# @<user-define-keyword>
@Confidence
Feature: To create job entry in the application
   Use Post /normal/webapi/add to create job entry in the application

  Background: Create and Initialize base URL
    Given url 'http://localhost:9897'

  Scenario: To create job entry in JSON format 
    Given path '/normal/webapi/add'
    And request {"jobId":3,"jobTitle":"Software Engg 3","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]},{"jobId":2,"jobTitle":"Business Analyst","jobDescription":"To develop andriod application","experience":["Google","Apple","Windows"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Selenium"]}]}
    And headers {Accept : 'application/json',Content-Type : 'application/json'}
    When method post
    Then status 201
    And print response
    And match response.jobTitle == 'Software Engg 3'

  Scenario: To create job entry in JSON format reading from file
    Given path '/normal/webapi/add'
    * def body = read("../postrequest/date/jobentry.json")
    And request body
    And headers {Accept : 'application/json',Content-Type : 'application/json'}
    When method post
    Then status 201
    And print response
    And match response.jobId == '4'

  Scenario: To create job entry in XML format reading from file
    Given path '/normal/webapi/add'
    * def body = read("../postrequest/date/jobentry.xml")
    And request body
    And headers {Accept : 'application/xml',Content-Type : 'application/xml'}
    When method post
    Then status 201
    And print response
    And match response/Job/jobTitle == 'Software Engg Level 3'
