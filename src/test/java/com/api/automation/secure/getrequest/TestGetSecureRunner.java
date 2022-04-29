package com.api.automation.secure.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetSecureRunner {
	
	@Test
	public Karate runTest() {
		
		return Karate.run("secureGetWithJWTToken").relativeTo(getClass());
		//return Karate.run("validateJSONFuzzyMatcher").relativeTo(getClass());
	}
	
//	@Test
//	public Karate runTestUsingClassPath() {
//		return Karate.run("classpath:com/api/automation/getrequest/getRequest2.feature");
//	}

}
