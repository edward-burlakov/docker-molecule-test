# Docker molecule

Docker image to test roles as part of a Jenkins pipeline.

# Usage

This image is an agent image to run molecule test inside a Jenkinsfile, for
example:

```
pipeline {
  agent {
    docker { image 'alainchiasson/docker-molecule' }
  }
  stages {
    stage('run test') {
      steps {
        sh 'molecule test'
      }
    }
  }
}
```

# Development

This repository is also setup to test/validate itself using a Jenkinsfile. The
role include here is a simple role to validate that the Molecule image works as
an agent on a generic Jenkins slave.

# TODO

The following needs to be done :

- Be Deliberate about versions.
- Implement release tags ( ansible/molecule combos)

The following need to be investigated :

- Add a way to integrate with external logging ( ARA ?)
- Test reports archive to Jenkins
- Integrate to statistics
  - On Image build ?
  - On Image usage ?
  - On Internals ( run and build )?
- Implement pipelines in an external Groovy lib ?
