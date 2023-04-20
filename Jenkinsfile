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
    options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
}

triggers {
    pullRequestFilter {
        branches {
            filter {
                branchFilter(filterType: 'RegularExpressionFilter', excludedBranches: 'master|develop', includedBranches: '.*')
            }
        }
        triggerOnTargetBranch(true)
    }
}

}
