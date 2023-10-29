pipeline {
  agent any
  environment {
        DOCKER_REGISTRY = "docker.io"
        DOCKER_IMAGE_NAME = "mydockernode"
    }

  stages {
    stage('Build and Test') {
      steps {
        // Install dependencies and run tests
        sh 'npm install'
        sh 'node --version'
        sh 'npm --version'
      }
    }
    stage('Build and Push Docker Image') {
       steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD $DOCKER_REGISTRY"
                    sh "docker build -t $DOCKER_IMAGE_NAME:latest -f Dockerfile ."
                    sh "docker push $DOCKER_IMAGE_NAME:latest"
                }
            }
        }
    }
}
	
