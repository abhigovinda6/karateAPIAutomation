Feature: To get the variables set by karate-config.js

  Background: To get the value of myVarName from karate-config and access in bacground section
    * def localmyVarname = myVarName
    Given print "Background variable value is =>", localmyVarname
    
  Scenario: To get the value of username and password from karate-config and use them in scenario
      * def localUserName = username
      Given print "Scenario variable value ==>", localUserName
      And print "Scenario variable value ==>", password
      
