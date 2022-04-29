Feature: To create job entry in the application
   Use Post /normal/webapi/add to create job entry in the application

  Scenario: To create job entry with JSON data
    Given url _url
    And path _path
    
    And request {"jobId":'#(_id)',"jobTitle":"Software Engg 3","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]},{"jobId":2,"jobTitle":"Business Analyst","jobDescription":"To develop andriod application","experience":["Google","Apple","Windows"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Selenium"]}]}
    And headers {Accept : 'application/json',Content-Type : 'application/json'}
    When method post
    Then status 201
