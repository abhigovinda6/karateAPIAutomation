package com.api.automation.postrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestJavaScriptRunner {

	
	@Test
	public Karate runTest() {
		
		//return Karate.run("getRequest2","responseMatcher").relativeTo(getClass());
		return Karate.run("embeddedExpression").relativeTo(getClass());
		//return Karate.run("javaScriptExecutor").relativeTo(getClass());

	}
	
}
