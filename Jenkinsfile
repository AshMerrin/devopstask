pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your version control system (e.g., Git)
                git branch: 'main', credentialsId: 'GithubToken', url:'https://github.com/AshMerrin/devopstask.git'
            }
        }

        stage('Build and Test') {
            steps {
                // Install dependencies and run tests
                sh 'npm install'
		sh 'node --version'
		sh 'npm --version'
            }
        }

        stage('Deploy') {
            steps {
                // Deploy your application (modify this step according to your deployment process)
                sh 'npm start'
            }
        }
    }
}
