Feature: To test the updation of job entry in the test application
      Test the end point PUT /normal/webapi/update

  Background: Create and Initialize base URL
    Given url 'http://localhost:9897'

  Scenario: To update job entry for existing job in JSON format
    # create a new job entry with post request
    # update the job entry using put request
    # using jsonPath verify the updation of details in job entry
    Given path '/normal/webapi/add'
    * def randomeValue = function() {return Math.floor((100) * Math.random());}
    * def id = randomeValue()
    And request {"jobId":'#(id)',"jobTitle":"Software Engg 3","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]},{"jobId":2,"jobTitle":"Business Analyst","jobDescription":"To develop andriod application","experience":["Google","Apple","Windows"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Selenium"]}]}
    And headers {Accept : 'application/json',Content-Type : 'application/json'}
    When method post
    Then status 201
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
       {
          "jobId": '#(id)',
          "jobTitle": "QA Analyst Level 3",
          "jobDescription": "To develop automation framework for andriod application and web app",
          "experience": [
              "Google",
              "Apple",
              "Windows"
          ],
          "project": [
              {
                  "projectName": "Movie App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Angular"
                  ]
              },
               {
                  "projectName": "IOS App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Swift"
                  ]
              }
          ]
      }
      """
    And headers {Accept : 'application/json',Content-Type : 'application/json'}
    When method put
    Then status 200
    # jsonPath API to filter the data for validation
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + id + ")].project")
    And print projectArray
    And match projectArray[0] == '#[2]'

  Scenario: To update job entry for existing job in JSON format by calling another feature file
    Given call read("../createJobEntry.feature")
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
       {
          "jobId": 124,
          "jobTitle": "QA Analyst Level 3",
          "jobDescription": "To develop automation framework for andriod application and web app",
          "experience": [
              "Google",
              "Apple",
              "Windows"
          ],
          "project": [
              {
                  "projectName": "Movie App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Angular"
                  ]
              },
               {
                  "projectName": "IOS App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Swift"
                  ]
              }
          ]
      }
      """
    And headers {Accept : 'application/json',Content-Type : 'application/json'}
    When method put
    Then status 200
    # jsonPath API to filter the data for validation
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == 125)].project")
    And print projectArray
    And match projectArray[0] == '#[2]'

  Scenario: To update job entry for existing job in JSON format by using shared context
    #Given call read("../createJobEntry.feature")
    * def postRequest = call read("../createJobEntry.feature")
    And print "The calling feature =>", postRequest.id
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
       {
          "jobId": '#(postRequest.id)',
          "jobTitle": "QA Analyst Level 3",
          "jobDescription": "To develop automation framework for andriod application and web app",
          "experience": [
              "Google",
              "Apple",
              "Windows"
          ],
          "project": [
              {
                  "projectName": "Movie App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Angular"
                  ]
              },
               {
                  "projectName": "IOS App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Swift"
                  ]
              }
          ]
      }
      """
    And headers {Accept : 'application/json',Content-Type : 'application/json'}
    When method put
    Then status 200
    # jsonPath API to filter the data for validation
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + postRequest.id + ")].project")
    And print projectArray
    And match projectArray[0] == '#[2]'

    
    
    Scenario: To update job entry for existing job in JSON format by calling helping feature file with variables
    #Given call read("../createJobEntry.feature") {var1:value, var2:value}
    * def randomeValue = function() {return Math.floor((100) * Math.random());}
    * def id = randomeValue()
    * def postRequest = call read("../createJobEntry2.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(id)'}
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
       {
          "jobId": '#(id)',
          "jobTitle": "QA Analyst Level 3",
          "jobDescription": "To develop automation framework for andriod application and web app",
          "experience": [
              "Google",
              "Apple",
              "Windows"
          ],
          "project": [
              {
                  "projectName": "Movie App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Angular"
                  ]
              },
               {
                  "projectName": "IOS App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Swift"
                  ]
              }
          ]
      }
      """
    And headers {Accept : 'application/json',Content-Type : 'application/json'}
    When method put
    Then status 200
    # jsonPath API to filter the data for validation
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + id + ")].project")
    And print projectArray
    And match projectArray[0] == '#[2]'
    