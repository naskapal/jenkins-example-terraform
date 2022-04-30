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
        sh './terraformw init'
        sh("echo $GCP_KEY > keyfile.json")
        sh('ls')
        sh('cat keyfile.json')
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
