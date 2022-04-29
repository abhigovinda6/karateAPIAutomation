pipeline {
     agent any
     
        parameters { choice(name: 'Environment', choices: ['staging', 'preprod', 'prod'], description: 'Profile needs to be used while executing test') }
        
    stages {
        stage ('CleanUp Stage') {
            steps {
                bat 'echo CleanUp Stage'
                cleanWs notFailBuild: true
            }
        }
        stage ('GIT Checkout Stage') {
            steps {
                bat 'echo GIT Checkout Stage'
                checkout([$class: 'GitSCM', branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/abhigovinda6/karateAPIAutomation.git']]])
            }
        }
        stage ('Restore Package Stage') {
            steps {
                bat 'echo Restore Package Stage'
                
            }
        }
        stage ('Build Stage') {
            steps {
                 bat 'echo Build Stage'
                 bat 'mvn clean compile'
            }
        }
        stage ('Test Execution Stage') {
            steps {
                 bat 'echo Test Execution Started'
                 bat 'mvn -P %Environment% test'
                 bat 'echo Test Execution Completed'
                 
            }
            
        }
    }
    
    post {
  always {
    // One or more steps need to be included within each condition's block.
    cucumber buildStatus: 'null', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/karate-reports', pendingStepsNumber: -1, reportTitle: 'Karate Test Execution', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
  }
}


}