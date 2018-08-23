# Docker molecule

Docker image to test roles as part of a Jenkins pipeline.

# Usage

This image is an agent image to run molecule test inside a Jenkinsfile, for
example:

```
pipeline {
  agent {
    docker {
      alwaysPull true
      image 'alainchiasson/docker-molecule'
      args '--privileged -v /DATA/docker-cache:/docker-cache'
    }
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

## Simple Role creation

The role and test information was built using :

```
molecule init role -r simple
```

Which selects defaults for everything - including testing inside docker. This
creates the role in the subdirectory simple, where molecule must be run from.
The first test is to make sure, it runs as is.

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
