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
        // Jenkins check out the role into a folder with arbitrary name,
        // we need to let Ansible know where to find role
        sh 'env'
      }
    }
    stage ("Display Molecule version") {
      steps {
        sh 'molecule --version'
      }
    }
    stage ("Validate Docker"){
      steps {
        sh 'docker info'
      }
    }
    stage ("Run tests"){
      steps {
        sh 'cd simple && molecule test'
      }
    }
  }
}
