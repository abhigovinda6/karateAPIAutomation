package com.api.automation.putrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunnerPut {
	@Test
	public Karate runTest() {
		
		//return Karate.run("getRequest2","responseMatcher").relativeTo(getClass());
		return Karate.run("updateJobEntry").relativeTo(getClass());
	}
}
