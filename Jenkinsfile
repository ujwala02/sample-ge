pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker-hub')
    }
    stages { 
        stage('git Checkout') {
            steps{
            git credentialsId: 'GIT_HUB_CREDENTIALS', url: 'https://github.com/ujwala02/sample-ge.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t sample/fastapi:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push sample/fastapi:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
