pipeline{
    agent any
    stages{
        stage('clone git') {
            steps {
                git branch: 'main', credentialsId: '80c9c43b-ed39-4ace-a724-e0b20e14bd8b', url: 'git@github.com:naskapal/dummy-server.git'
            }
        }
        
        stage('build image') {
            steps {
                script {
                    dockerImage = docker.build ('asia.gcr.io/kapal-private/testdummy:latest', "--no-cache .")
                }
            }
        }
        
        stage('push image') {
            steps {
                script {
                    withCredentials([file(credentialsId: 'fd277cd0-c8da-4843-847c-e40256d0e356', variable: 'keyfile')]) {
                        sh('gcloud auth activate-service-account --key-file=${keyfile}')
                        dockerImage.push()
                    }
                    
                }
            }
        }
    }
}
