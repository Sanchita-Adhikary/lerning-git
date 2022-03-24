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
                git([url: 'https://github.com/Sanchita-Adhikary/lerning-git.git', credentialsId: 'Sanchita1505'])
            }
        }
        stage('Build Image') {
          agent{
            docker{image 'node:12-alpine'}
          }
            steps {
               sh 'npm install'
              sh 'npm run build'
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
