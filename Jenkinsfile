pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'ap-south-1'
        TF_WORKING_DIR = "C:\\terraform_project"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Keerthana-Bindhurani/Terraform-project.git'
            }
        }

        stage('Initialize Terraform') {
            steps {
                script {
                    bat 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -File init.ps1'
                }
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
