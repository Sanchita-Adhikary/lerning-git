pipeline {
  environment {
    
    dockerImage = ''
    registryCredential = 'sanchita1505/mynginxapp'
    }
    agent any
    stages {
        stage('Git Clone') {
            steps {
                git([url: 'https://github.com/Sanchita-Adhikary/lerning-git.git', credentialsId: 'Sanchita1505'])
            }
        }
        stage('Build Image') {
            steps {
               script {
                 dockerImage = docker.build registryCredential
               }
            }
        }
        stage('Deploy Image') {
            steps {
                script {
                  docker.withRegistry( '', registryCredential ) {
                    dockerImage.push("$BUILD_NUMBER")
                  }
                }
            }
        }
        stage('Remove Unused docker image') {
            steps {
              sh "docker rmi $imagename:$BUILD_NUMBER"
             }
        }
    }
}
