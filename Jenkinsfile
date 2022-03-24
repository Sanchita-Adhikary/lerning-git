pipeline {
  environment {
    imagename = "sanchita1505/mynginxapp"
    registryCredential = 'dockerhub'
    dockerImage = ''

    }
    agent any
    stages {
        stage('Git Clone') {
            steps {
                git([url: 'https://github.com/Sanchita-Adhikary/lerning-git.git', credentialsId: 'github'])
            }
        }
        stage('Build Image') {
            steps {
               script {
                 dockerImage = docker.build imagename
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
