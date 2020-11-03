pipeline {

    agent {
        docker {
            label 'dotnet'
            image 'mcr.microsoft.com/dotnet/core/sdk:3.1' 
        }
        docker {
            label 'node'
            image 'node:14-alpine'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm 
            }
        }
        stage('dotnet') {
            environment {
                DOTNET_CLI_HOME = "/tmp/DOTNET_CLI_HOME"
            }
            agent {
                docker {
                    label 'dotnet'
                }
            }
            steps {
                sh "dotnet build"
                sh "dotnet test"
            }
        }
        stage('npm') {
            agent {
                docker {
                    label 'node'
                }
            }
            steps {
                sh "npm ci"
                sh "npm run build"
                sh "npm run lint"
                sh "npm test"
            }
        }
    }
}