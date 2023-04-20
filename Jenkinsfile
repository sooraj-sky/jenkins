pipeline {
    agent any
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build('my-docker-image:latest', '-f JenkinsDockerfile .')
                }
            }
        }
    }
}
