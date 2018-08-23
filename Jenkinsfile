pipeline {
  agent {
    docker {
      alwaysPull true
      image 'alainchiasson/docker-molecule:develop'
      args '--privileged -v /DATA/docker-cache:/docker-cache'
    }
  }
  stages {
    stage ("Display environment info") {
      steps {
        sh 'env'
      }
    }
    stage ("Display Molecule version") {
      steps {
        sh 'molecule --version'
      }
    }
    stage ("Validate Docker."){
      steps {
        sh 'docker info'
      }
    }
    stage ("Validate Tests Pass."){
      steps {
        sh 'cd simple && molecule test'
      }
    }
  }
}
