# In this directory, run the following command to build this builder.
# $ gcloud builds submit . --config=cloudbuild.yaml
substitutions:
  _DOCKER_COMPOSE_VERSION: 1.25.5
steps:
- name: 'gcr.io/cloud-builders/docker'
  args:
  - 'build'
  - '--build-arg'
  - 'DOCKER_COMPOSE_VERSION=${_DOCKER_COMPOSE_VERSION}'
  - '-t'
  - 'gcr.io/$PROJECT_ID/docker-compose:latest'
  - '-t'
  - 'gcr.io/$PROJECT_ID/docker-compose:${_DOCKER_COMPOSE_VERSION}'
  - '.'
- name: 'gcr.io/$PROJECT_ID/docker-compose'
  args: ['version']

images:
- 'gcr.io/$PROJECT_ID/docker-compose:latest'
- 'gcr.io/$PROJECT_ID/docker-compose:${_DOCKER_COMPOSE_VERSION}'
tags: ['cloud-builders-community']