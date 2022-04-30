pipeline {
  agent { label 'linux'}
  environment {
        GCP-KEY = credentials('gcp-key')
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
        sh 'GOOGLE-APPLICATION-CREDENTIALS=${env.gcp-key}'
        sh './terraformw init'
        sh './terraformw apply -auto-approve -no-color'
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}
