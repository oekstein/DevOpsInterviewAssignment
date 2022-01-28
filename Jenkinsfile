pipeline {
    agent any
    environment {
        DOCKER_CRED = credentials('dockerhub')
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
                    sh "python3 -m unittest microservice/tests/test_service.py"
                }
            }
        }
        stage('build and push image') {
            steps {
                script {
                    sh """
                    docker build -t erzez/bitdam:${BUILD_NUMBER} .
                    docker login --username $DOCKER_CRED_USR --password $DOCKER_CRED_PSW
                    docker push erzez/bitdam:${BUILD_NUMBER}
                    """
                }
            }
        }
        stage('deploy image') {
            steps {
                script {
                        sh """
                        kubectl get pods --namespace=all-namespaces
                        """
                }
            }
        }
    }
}