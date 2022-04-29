package com.api.automation.configuration;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestConfigRunner {
	
	@Test
	public Karate runTest() {
		
		return Karate.run("getGlobalConfig").relativeTo(getClass());
		//return Karate.run("validateJSONFuzzyMatcher").relativeTo(getClass());
	}
	
//	@Test
//	public Karate runTestUsingClassPath() {
//		return Karate.run("classpath:com/api/automation/getrequest/getRequest2.feature");
//	}

}
