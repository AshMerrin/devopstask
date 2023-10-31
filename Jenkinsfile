pipeline {
    agent any
       stages {
       stage('Build Docker Image') {
            steps {
                // Build a Docker image for your Node.js application
                script {
                      git branch: 'main', credentialsId: 'GithubToken', url: 'https://github.com/AshMerrin/dockertask.git'
                          
                }    
              }
            } 
       
      stage('Clone Devopsfile Repository') {
            steps {
                script {
                    // Clone the repository containing app.js and package.json
                    git branch: 'main', credentialsId: 'GithubToken', url: 'https://github.com/AshMerrin/devopstask.git'
                    def imageName = "mydockernode:latest"
                    def dockerFile = "/home/DevTask3/dockertask/Dockerfile" // Path to your Dockerfile
 
                    sh "docker build -t ${imageName} -f ${dockerFile} ."
                }
            }
        }
        
       
        stage('Push Docker Image') {
            steps {
                // Push the Docker image to a Docker registry (e.g., Docker Hub)
                script {
                    def imageName = "mydockernode:latest"
                    def registryURL = "docker.io/ashmerrin" // Replace with your Docker Hub username
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD ${registryURL}"
                    }
                    sh "docker tag ${imageName} ${registryURL}/${imageName}"
                    sh "docker push ${registryURL}/${imageName}"
                }
            }
        }
    }
}
