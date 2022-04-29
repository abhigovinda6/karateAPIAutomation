Feature: Variables creation in Karate Framework

Background: Set up base path
    * def var4_int = 60
    * def var6_str = "Java"


  # <Gherkin Keyword> <def> <Variable_name> = <Value>
  Scenario: To create a variable
    Given def var_int = 10
    And def var_string = "Karate"
    Then print "Int variable => ",var_int
    And print "String variable => ",var_string
    * def var_int_1 = var_int + 10
    And print "New Variable => ",var_int_1
    And print "Background variable integer => ",var4_int

  Scenario: To create a variable with just *
    * def var1_int = 30
    * def var2_string = "Hello"
    Then print "Int variable => ",var1_int
    And print "String variable => ",var2_string
    * def var_int_3 = var1_int + 10
    And print "New Variable => ",var_int_3
    And print "Background variable string => ",var6_str
