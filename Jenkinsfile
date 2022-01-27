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
                    checkout scm
                }
            }
        }
        stage('run tests') {
            steps {
                script {
                    sh """
                    sudo apt update
                    sudo apt install -y python3-pip
                    pip3 install virtualenv unittest
                    python -m unittest -v microservice/tests/test_service.py
                    """
                }
            }
        }
        stage('build and push image') {
            steps {
                script {
                    sh """
                    docker build -t erzez/bitdam:${BUILD_NUMBER} .
                    docker push erzez/bitdam:${BUILD_NUMBER}
                    """
                }
            }
        }
        stage('deploy image') {
            steps {
                script {
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }
}