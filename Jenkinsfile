pipeline {
    agent {
        docker { image 'mcr.microsoft.com/dotnet/core/sdk:3.1' }
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm 
            }
        }
        stage('Build') {
            steps {
                sh "dotnet build"
            }
        }
        stage('Test') {
            steps {
               sh "dotnet test"
            }
        }
    }
}