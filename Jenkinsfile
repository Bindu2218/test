// node {
//     stage('Cloning the project') {
//         // Clone your project from Git if needed
//         git branch: 'main', url: 'https://github.com/BINDU1822/sonar-jenkins.git'
//     }

//     stage('Sonarqube Static code analysis') {
//         def scannerHome = tool 'sonarqube'; // Assuming you have a SonarQube tool configured in Jenkins

//         // Set up SonarQube environment and execute the scanner
//         withSonarQubeEnv('sonarqube') {
//             def scannerCmd = """
//                 ${scannerHome}/bin/sonar-scanner \
//                 -Dsonar.login=admin \
//                 -Dsonar.password=binduramesh@1822 \
//                 -Dsonar.projectKey=sonartest \
//                 -Dsonar.exclusions=vendors/**,resources/**,**/*,java \
//                 -Dsonar.host.url=http://localhost:9000
//             """
//             bat script: scannerCmd, returnStatus: true
//         }

//         // Check the return status of the SonarQube analysis
//         if (currentBuild.resultIsWorseOrEqualTo('FAILURE')) {
//             error('SonarQube analysis failed.')
//         }
//     }



pipeline {
    agent any
    environment{
        dockerImage=''
        registry='bindu1822/pythonapp'
        registryCredentials='docker_id'
    }
    stages {
        stage('checkout') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/Bindu2218/test.git'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage=docker.build registry
                }
            }
        }
        stage('Static Code Analysis') {
            steps {
                    def scannerHome = tool 'sonarqube'; // Assuming you have a SonarQube tool configured in Jenkins

                    // Set up SonarQube environment and execute the scanner
                    withSonarQubeEnv('sonarqube') {
                        def scannerCmd = """
                            ${scannerHome}/bin/sonar-scanner \
                            -Dsonar.login=admin \
                            -Dsonar.password=binduramesh@1822 \
                            -Dsonar.projectKey=sonartest \
                            -Dsonar.exclusions=vendors/**,resources/**,**/*,java \
                            -Dsonar.host.url=http://localhost:9000
                        """
                        bat script: scannerCmd, returnStatus: true
                    }
            }
        }
        // stage('Push Docker Image') {
        //     steps {
        //         script {
        //                     // docker.WithRegistry('', registryCredentials){
        //                         dockerImage.Push()
        //                     // }
        //         }
        //     }
        // }
    }
}
        

