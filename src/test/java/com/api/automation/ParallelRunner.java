package com.api.automation;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class ParallelRunner {
	
	@Test
	public void executeKarateTests() {
		Runner.parallel(getClass(), 6);
		
	
	}

}
