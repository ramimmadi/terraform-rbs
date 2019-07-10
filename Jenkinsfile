pipeline {
  agent any
  environment {
    SVC_ACCOUNT_KEY = credentials('terraform-auth')
  }
 stages {
   stage('Preparing Environment') {
      steps {
          // using the one of the containers jnlp, if you are not using any specific container you will use nodes alone. Clone Routing repo to workspace
          git branch: 'master',  url: 'https://github.com/ramimmadi/terraform-rbs.git'
      }  
    }
   stage('Cred prep') {
      steps {
        sh 'mkdir -p creds'
        sh 'echo terraform creds copy'
      }
    }
   stage('TF Plan') {
       steps {
           sh 'terraform init'
           sh 'terraform plan -out myplan'
       }
     }
   stage('Creation Approval') {
      steps {
        script {
          def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
        }
      }
    }

    stage('TF Apply') {
      steps {
        
          sh 'terraform apply -input=false myplan'
        
      }
    }
       stage('Destroy Approval') {
      steps {
        script {
          def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
        }
      }
    }
        stage('TF Destroy') {
      steps {
        
          sh 'terraform destroy -auto-approve'
        
      }
    }
  }
}

