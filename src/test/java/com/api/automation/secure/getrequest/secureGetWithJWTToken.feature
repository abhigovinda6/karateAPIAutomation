Feature: To send GET request with JWT token
     https://jobapplicationjwt.herokuapp.com/auth/webapi/all
     
     
     Scenario: To send GET request with JWT token
     * def token = call read('../../getToken.feature')  {userName:'John Wick',password:'Gunes and Bikes'}
     Given url 'https://jobapplicationjwt.herokuapp.com/auth/webapi/all'
     And headers {Accept:'application/json', Authorization:'#("Bearer " + token.authToken)'}
     When method get
     Then status 200
     
     
     
     Scenario: To send GET request without JWT token
     Given url 'https://jobapplicationjwt.herokuapp.com/auth/webapi/all'
     And headers {Accept:'application/json', Authorization:'#("Bearer " + token.authToken)'}
     When method get
     Then status 401