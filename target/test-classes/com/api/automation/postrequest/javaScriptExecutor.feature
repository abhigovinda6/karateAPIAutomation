Feature: To execute the java script function


Scenario: Execute java script function without parameter

   * def getValue = function() {return 10;}
   Then print "Function Value =>", getValue()
   * def randomeValue = function() {return Math.floor((100) * Math.random());}
   Then print "Random Value =>", randomeValue()
   * def getStringValue = function(arg1) {return "Hello " + arg1;}
   Then print "String Value =>", getStringValue("World")