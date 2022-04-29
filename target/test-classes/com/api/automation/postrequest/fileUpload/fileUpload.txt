Feature: To test the get end point of the application
  To test different get end point with different formats supported by the application

  Background: Set up base path
    Given url 'http://localhost:9897'

  Scenario: To get all the data from application in xml format using response keyword
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
    And print response
    And match response ==
      """
      <List>
      <item>
          <jobId>1</jobId>
          <jobTitle>Software Engg</jobTitle>
          <jobDescription>To develop andriod application</jobDescription>
          <experience>
              <experience>Google</experience>
              <experience>Apple</experience>
              <experience>Mobile Iron</experience>
          </experience>
          <project>
              <project>
                  <projectName>Movie App</projectName>
                  <technology>
                      <technology>Kotlin</technology>
                      <technology>SQL Lite</technology>
                      <technology>Gradle</technology>
                  </technology>
              </project>
          </project>
      </item>
      </List>

      """

  Scenario: To get all the data from application in JSON format using response keyword
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
    And print response
    And match response ==
      """
      [
      {
          "jobId": 1,
          "jobTitle": "Software Engg",
          "jobDescription": "To develop andriod application",
          "experience": [
              "Google",
              "Apple",
              "Mobile Iron"
          ],
          "project": [
              {
                  "projectName": "Movie App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Gradle"
                  ]
              }
          ]
      }
      ]
      """

  Scenario: To get all the data from application in JSON format and validate using negate condition
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
    And print response
    And match response !=
      """
      [
      {
          "jobId": 1,
          "jobTitle": "Software Engg",
          "jobDescription": "To develop andriod application",
          "experience": [
              "Google",
              "Apple",
              "Mobile Iron"
          ],
          "project": [
              {
                  "projectName": "Movie App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Gradle"
                  ]
              }
          ]
      }
      ]
      """

  Scenario: To get all the data from application in JSON format and validate specific property
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    #Base path + Context Path
    When method get # Send the get request
    Then status 200 # the status code response should be 200
    And print response
    And match response contains deep {"jobDescription": "To develop andriod application"}
    And match response contains deep {"project":[{"projectName": "Movie App"}]}
    And match header Content-Type == 'application/json'
    And match header Connection == 'keep-alive'