package com.api.automation.postrequest.datadriven;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunnerPostDataDriven {

	@Test
	public Karate runTest() {
		
		//return Karate.run("getRequest2","responseMatcher").relativeTo(getClass());
		return Karate.run("postDataDriven").relativeTo(getClass());
	}
}
