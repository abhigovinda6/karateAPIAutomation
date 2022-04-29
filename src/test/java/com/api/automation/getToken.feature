@ignore
Feature: To get the JWT token for the user
   https://jobapplicationjwt.herokuapp.com/users/sign-up

  Scenario: Register the user and generate token
    Given url 'https://jobapplicationjwt.herokuapp.com/users/sign-up'
    And headers {Accept:'application/json', Content-Type : 'application/json'}
    And request {username:'#(userName)',password:'#(password)'}
    When method post
    Then status 200

  #Login and authenticate to generate token
  Scenario: Login the username and password and generate token
    Given url 'https://jobapplicationjwt.herokuapp.com/users/authenticate'
    And headers {Accept:'application/json', Content-Type : 'application/json'}
    And request {username:'#(userName)',password:'#(password)'}
    When method post
    Then status 200
    * def authToken = response.token
