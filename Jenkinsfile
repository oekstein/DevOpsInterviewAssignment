pipeline {
    agent any
    environment {
        registry = "oekstein/DevOpsInterviewAssignment"
        registryCredential = 'docker_hub'
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '20', daysToKeepStr: '5' ))
    }
    stages {
        stage('Pull Code') {
            steps {
                script {
                    sh 'echo pull code'
                }
            }
        }
        stage('run tests') {
            steps {
                script {
                    sh 'echo run tests'
                }
            }
        }
        stage('build and push image') {
            steps {
                script {
                    sh 'build and push image to hub'
                }
            }
        }
        stage('deploy image') {
            steps {
                script {
                    sh 'build docker image'
                }
            }
        }
    }
}