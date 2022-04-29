package com.api.automation;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

public class ParallelBuilder {

	@Test
	public void executeKaratetest() {
		
		Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/automation");
		Results result = aRunner.parallel(6); //create 6 threads and use those threads for execution
		System.out.println("Total features=> "+result.getFeaturesTotal());
		System.out.println("Total scenarios=> "+result.getScenariosTotal());
		System.out.println("Passed scenarios=> "+result.getScenariosPassed());
		Assertions.assertEquals(0, result.getScenariosFailed(), "There are some failed scenarios");
	}
}
