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
                    image 'mcr.microsoft.com/dotnet/core/sdk:3.1' 
                }
            }
            stage('build') {
                steps {
                    sh "dotnet build"
                }
            }
            stage('test') {
                steps {
                    sh "dotnet test"
                }
            }
        }
        stage('npm') {
            agent {
                docker {
                    image 'node:14-alpine'
                }
            }
            stage('ci') {
                steps {
                    dir("DotnetTemplate.Web") {
                        sh "npm ci"
                    }
                }
            }
            stage('build') {
                steps {
                    dir("DotnetTemplate.Web") {
                        sh "npm run build"
                    }
                }
            }
            stage('lint') {
                steps {
                    dir("DotnetTemplate.Web") {
                        sh "npm run lint"
                    }
                }
            }
            stage('test') {
                steps {
                    dir("DotnetTemplate.Web") {
                        sh "npm t"
                    }
                }
            }
        }
    }
}