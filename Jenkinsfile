pipeline {

    agent none

    stages {
        stage('Checkout') {
            agent any
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
                    image 'mcr.microsoft.com/dotnet/core/sdk:3.1' 
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
                    image 'node:14-alpine'
                }
            }
            steps {
                dir("DotnetTemplate.Web") {
                    sh "npm ci"
                    sh "npm run build"
                    sh "npm run lint"
                    sh "npm t"
                }
            }
        }
    }
}