#!/usr/bin/env groovy

node('skopeo-image-copy') {

  stage('Copy Image') {

    sh "themurph:cool_password@docker://docker.io/themurph/myimage:latest"  "docker://production.registry/myimage:v1.0"

  }
}
