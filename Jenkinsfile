pipeline {
  agent {
    docker {
      image 'alainchiasson/docker-molecule:develop'
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
  }
}
