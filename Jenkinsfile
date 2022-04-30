pipeline {
  agent { label 'linux'}
  environment {
        GCP_KEY = credentials('gcp-key')
  }
  options {
    skipDefaultCheckout(true)
  }
  stages{
    stage('clean workspace') {
      steps {
        cleanWs()
      }
    }
    stage('checkout') {
      steps {
        checkout scm
      }
    }
    stage('terraform') {
      steps {
        withCredentials([file(credentialsId: 'gcp-key', variable: 'keyfile')]) {
          sh './terraformw init'
          sh 'cat ${keyfile} > keyfile.json'
          sh './terraformw apply -auto-approve -no-color'
        }
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}
