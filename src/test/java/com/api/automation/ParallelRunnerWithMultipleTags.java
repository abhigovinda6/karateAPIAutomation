package com.api.automation;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class ParallelRunnerWithMultipleTags {
	
	private static final String CLASS_PATH = "classpath:";
	private static final String DELIMITER = ",";
	@Test
	public void executeKaratetest() {
		
		Builder aRunner = new Builder();
		aRunner.path(getLocation()).tags(getTags());
	    aRunner.parallel(6); //create 6 threads and use those threads for execution
	
	
	}
	
	private List<String> getTags() {
		String aTags = System.getProperty("tags","@Confidence");
		List<String> aTagsList = Collections.emptyList();
		if(aTags.contains(DELIMITER)) {
			String[] tagsArray = aTags.split(DELIMITER);
			aTagsList = Arrays.asList(tagsArray);
			return aTagsList;
		}
	    aTagsList = Arrays.asList(aTags);
		return aTagsList;
	}
	
	private List<String> getLocation() {
		String aLocation = System.getProperty("location","@Confidence");
		List<String> aLocationList = Collections.emptyList();
		if(aLocation.contains(DELIMITER)) {
			String[] locationArray = aLocation.split(DELIMITER);
			aLocationList = Arrays.asList(locationArray);
			aLocationList.replaceAll((entry -> {
				return CLASS_PATH + entry; 
			})); //pre append classpath to every entry in the list 
		}
		aLocationList = Arrays.asList(CLASS_PATH + aLocation);
		return aLocationList;
	}
}

