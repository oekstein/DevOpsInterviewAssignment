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
                    ENV PYTHONUNBUFFERED=1
                    apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
                    python3 -m ensurepip
                    pip3 install --no-cache --upgrade pip setuptools virtualenv unittest
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