package com.api.automation.postrequest.fileUpload;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPostUploadRunner {
	@Test
	public Karate runTest() {
		
		//return Karate.run("getRequest2","responseMatcher").relativeTo(getClass());
		//return Karate.run("createJobEntry").relativeTo(getClass());
		return Karate.run("validateFileUpload").relativeTo(getClass());

	}
	
}
