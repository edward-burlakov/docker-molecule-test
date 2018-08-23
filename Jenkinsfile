pipeline {
  agent {
    docker {
      image 'alainchiasson/docker-molecule'
    }
  }
  stages {
    stage ("Display environment info") {
      steps {
        // Jenkins check out the role into a folder with arbitrary name,
        // we need to let Ansible know where to find role
        sh 'env'
        sh 'molcule --version'
      }
    }
    stage ("Validate Docker"){
      steps {
        sh 'docker info'
      }
    }
  }
}
