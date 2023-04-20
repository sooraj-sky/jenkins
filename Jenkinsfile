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

options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
}

triggers {
    pullRequestFilter {
        branches {
            filter {
                branchFilter(filterType: 'RegularExpressionFilter', excludedBranches: 'main|dev', includedBranches: '.*')
            }
        }
        triggerOnTargetBranch(true)
    }
}

