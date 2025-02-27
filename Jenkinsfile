pipeline {
    agent any
    
    environment {
        TF_WORKING_DIR = "C:\\terraform_project" // Change this if needed
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Keerthana-Bindhurani/Terraform-project.git'
            }
        }
        
        stage('Initialize Terraform') {
            steps {
                powershell '''
                cd $env:TF_WORKING_DIR
                terraform init
                '''
            }
        }

        stage('Validate Terraform') {
            steps {
                powershell '''
                cd $env:TF_WORKING_DIR
                terraform validate
                '''
            }
        }

        stage('Plan Infrastructure') {
            steps {
                powershell '''
                cd $env:TF_WORKING_DIR
                terraform plan -out=tfplan
                '''
            }
        }

        stage('Apply Infrastructure') {
            steps {
                input message: 'Approve Terraform Apply?', ok: 'Apply'
                powershell '''
                cd $env:TF_WORKING_DIR
                terraform apply -auto-approve
                '''
            }
        }
    }
}
