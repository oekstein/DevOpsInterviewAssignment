pipeline {
    agent {
        label "jenkins-slave"
    }
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
        stage('run unittests') {
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
                    docker build -t erzez/bitdam1:${BUILD_NUMBER} .
                    docker login --username $DOCKER_CRED_USR --password $DOCKER_CRED_PSW
                    docker push erzez/bitdam1:${BUILD_NUMBER}
                    """
                }
            }
        }
        stage('deploy image') {
            steps {
                script {
                    withCredentials([file(credentialsId: 'kubeconfig', variable: 'config')]) {
                        sh """
                        export KUBECONFIG=\${config}
                        kubectl set image deployment/microservice-deployment microservice=bitdam1:${BUILD_NUMBER}
                        kubectl rollout restart deployment microservice-deployment
                        """
                    }
                }
            }
        }
    }
}
