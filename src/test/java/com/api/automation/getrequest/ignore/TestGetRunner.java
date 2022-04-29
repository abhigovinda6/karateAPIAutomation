package com.api.automation.getrequest.ignore;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetRunner {
	
	@Test
	public Karate runTest() {
		
		return Karate.run("getRequest2","responseMatcher").tags("~@ignore").relativeTo(getClass());// will ignore scenarios and feature with ignore tag
		//return Karate.run("validateJSONFuzzyMatcher").relativeTo(getClass());
	}
	
//	@Test
//	public Karate runTestUsingClassPath() {
//		return Karate.run("classpath:com/api/automation/getrequest/getRequest2.feature");
//	}

}
