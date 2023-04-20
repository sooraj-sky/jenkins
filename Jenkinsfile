pipeline {
    agent any
    
    stages {
        stage('Build Docker Images') {
            steps {
                script {
                    def dockerImage = docker.build('my-docker-image:latest', '-f JenkinsDockerfile .')
                }
            }
        }
    }
}
