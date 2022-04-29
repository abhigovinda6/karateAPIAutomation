package com.api.automation;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class ParallelBuilderWithCucumberReport {

	@Test
	public void executeKaratetest() {
		
		Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/automation").outputCucumberJson(true); // need to set to true as default report is in HTML
		Results result = aRunner.parallel(6); //create 6 threads and use those threads for execution
		System.out.println("Total features=> "+result.getFeaturesTotal());
		System.out.println("Total scenarios=> "+result.getScenariosTotal());
		System.out.println("Passed scenarios=> "+result.getScenariosPassed());
		generateCucumberReport(result.getReportDir()); //will get report directory 
		Assertions.assertEquals(0, result.getScenariosFailed(), "There are some failed scenarios");
	}
	//reportDirLocation-> C:\Users\abhis\Downloads\karateframework\karateframework\target\karate-reports
	private void generateCucumberReport(String reportDirLocation) {
		File reportDir = new File(reportDirLocation); // we need file object to filter json files in reports directory
		Collection<File> jsonCollection = FileUtils.listFiles(reportDir, new String[] {"json"}, true); //we will use this to filter json files
		
		
		List<String> jsonFiles = new ArrayList<String>(); //will contain absoulte path or location of json files
		jsonCollection.forEach(file->jsonFiles.add(file.getAbsolutePath())); //get the absolute path of json file and add to list
		
		//object of configuration class
		Configuration configuration = new Configuration(reportDir, "Karate Run"); //second argument is project name it will appear in report
		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration); //first parameter is list of json files and configuration object is 2nd paramter
		reportBuilder.generateReports(); //will generate report
		
	}
}
