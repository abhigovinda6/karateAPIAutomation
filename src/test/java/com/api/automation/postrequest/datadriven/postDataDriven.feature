Feature: To create job description in the test application

  Background: 
    * def testData = read("testData.csv")

  Scenario Outline: To create job description in the test application <method>
    Given print '<url>'
    Then print  '<path>'
    When print  '<method>'
    And print    '<status>'

    Examples: 
      | url                   | path               | method | status |
      | http://localhost:9897 | /normal/webapi/all | get    |    200 |
      | http://localhost:9897 | /normal/webapi/add | post   |    201 |
      | http://localhost:9897 | /normal/webapi/add | put    |    201 |

  Scenario Outline: To create job entry in JSON format
    Given url 'http://localhost:9897'
    And path '/normal/webapi/add'
    And request {"jobId":'#(jobId)',"jobTitle":'#(jobTitle)',"jobDescription":'#(jobDescription)',"experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]},{"jobId":2,"jobTitle":"Business Analyst","jobDescription":"To develop andriod application","experience":["Google","Apple","Windows"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Selenium"]}]}
    And headers {Accept : 'application/json',Content-Type : 'application/json'}
    When method post
    Then status <status>

    Examples: 
      | jobId | jobTitle        | jobDescription             | status |
      |  1360 | Software Engg 4 | To develop ios application |    201 |
      | ID    | Software Engg 4 | To develop ios application |    400 |
      | false | Software Engg 4 | To develop ios application |    400 |

  Scenario Outline: To create job entry in JSON format with CSV file <jobId>
    Given url 'http://localhost:9897'
    And path '/normal/webapi/add'
    And request {"jobId":'#(jobId)',"jobTitle":'#(jobTitle)',"jobDescription":'#(jobDescription)',"experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]},{"jobId":2,"jobTitle":"Business Analyst","jobDescription":"To develop andriod application","experience":["Google","Apple","Windows"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Selenium"]}]}
    And headers {Accept : 'application/json',Content-Type : 'application/json'}
    When method post
    Then status <status>

    Examples: 
          |testData|
          
          # |read("testData.csv")|
