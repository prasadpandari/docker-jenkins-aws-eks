pipeline {
     agent any
     stages {
         stage('init') {
              steps {
                  sh 'echo Starting the Image build process...'
              }
         }
         stage('Lint') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
         stage('Build Image') {
              steps {
                  sh 'docker build -t prasadpandari/prasad-capstone .'
              }
         }
         stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "docker-hub"]) {
                      sh 'docker push prasadpandari/prasad-capstone'
                  }
              }
         }

     }
}