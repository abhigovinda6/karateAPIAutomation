package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetRunnerVariable {

	
	@Test
	public Karate runTest() {
		
		//return Karate.run("getRequest2","responseMatcher").relativeTo(getClass());
		return Karate.run("varaiableKarate").relativeTo(getClass());
	}
}
