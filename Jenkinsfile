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

         stage('Deploying') {
              steps{
                  echo 'AWS deployment'
                  withAWS(region: 'us-west-2', ,credentials:'aws-static') {
                      sh "aws eks --region us-west-2 update-kubeconfig --name prod"
                      sh "kubectl config use-context arn:aws:eks:us-west-2:967852153283:cluster/prod"
                      sh "kubectl set image deployments/prasad-capstone prasad-capstone=prasadpandari/prasad-capstone:latest"
                      sh "kubectl apply -f kubedeployment/deployment.yml"
                      sh "kubectl get nodes"
                      sh "kubectl get deployment"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get service/prasad-capstone"
                  }
              }
        }

     }
}