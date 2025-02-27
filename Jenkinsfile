pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'ap-south-1'
        TERRAFORM_PATH        = 'C:\\Users\\keert\\Downloads\\terraform_1.10.5_windows_amd64 (2)\\terraform.exe'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Keerthana-Bindhurani/Terraform-project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                powershell "\"${env.TERRAFORM_PATH}\" init"
            }
        }

        stage('Terraform Plan') {
            steps {
                powershell "\"${env.TERRAFORM_PATH}\" plan"
            }
        }

        stage('Terraform Apply') {
            steps {
                powershell "\"${env.TERRAFORM_PATH}\" apply -auto-approve"
            }
        }
    }
}
