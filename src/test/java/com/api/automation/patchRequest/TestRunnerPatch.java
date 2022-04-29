package com.api.automation.patchRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunnerPatch {
	@Test
	public Karate runTest() {
		
		//return Karate.run("getRequest2","responseMatcher").relativeTo(getClass());
		return Karate.run("updateJobDescriptionPatch").relativeTo(getClass());
		//return Karate.run("javaScriptExecutor").relativeTo(getClass());

	}
}
