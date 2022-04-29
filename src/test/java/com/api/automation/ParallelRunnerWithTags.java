package com.api.automation;

import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class ParallelRunnerWithTags {
	
	private static final String CLASS_PATH = "classpath:";
	@Test
	public void executeKaratetest() {
		
		Builder aRunner = new Builder();
		aRunner.path(getLocation()).tags(getTags());
	    aRunner.parallel(6); //create 6 threads and use those threads for execution
	
	
	}
	
	private List<String> getTags() {
		String aTags = System.getProperty("tags","@Confidence");
		List<String> aTagsList = Arrays.asList(aTags);
		return aTagsList;
	}
	
	private List<String> getLocation() {
		String aLocation = System.getProperty("location","@Confidence");
		List<String> aLocationList = Arrays.asList(CLASS_PATH + aLocation);
		return aLocationList;
	}
}

