def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
    ]

pipeline {
    agent any

    tools {
       terraform 'Terraform' 
    }
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }

    stages {
        stage('Git Checkout') {
            steps {
                echo 'Cloning codebase from GITHUB to Jenkins'
                git branch: 'main', credentialsId: 'git-credential', url: 'https://github.com/devopsmike-01/wandaprep-tf-infra-repo.git'
                sh 'ls'
            }
        }
        
        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        
        stage('Terraform Plan'){
            steps {
                sh 'terraform plan'
            }
        }
        
        stage('Terraform Apply/Destroy the above plan'){
            steps{
                sh 'terraform ${action} --auto-approve'
                // sh 'terraform apply --auto-approve'
                // sh 'terraform destroy --auto-approve'
            }
        }
        
        
    }
    
    post { 
        always { 
            echo 'Sending build Result!'
            slackSend channel: '#wandaprep-infra-team', color: COLOR_MAP[currentBuild.currentResult], message: "Build done by Mike - Build Started - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)"
        }
    }
    
}
