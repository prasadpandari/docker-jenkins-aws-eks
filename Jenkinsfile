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
                  sh 'docker build -t prasad-capstone .'
              }
         }
         stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "prasadpandari-dockerhub"]) {
                      sh "docker tag prasad-capstone prasadpandari/prasad-capstone"
                      sh 'docker push prasadpandari/prasad-capstone'
                  }
              }
         }

     }
}