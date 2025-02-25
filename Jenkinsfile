pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Terraform Init') {
            steps {
                powershell '"C:\\Users\\keert\\Downloads\\terraform_1.10.5_windows_amd64 (1)\\terraform.exe" init'
            }
        }

        stage('Plan') {
            steps {
                powershell '"C:\\Users\\keert\\Downloads\\terraform_1.10.5_windows_amd64 (1)\\terraform.exe" plan'
            }
        }

        stage('Apply') {
            steps {
                powershell '"C:\\Users\\keert\\Downloads\\terraform_1.10.5_windows_amd64 (1)\\terraform.exe" apply -auto-approve'
            }
        }
    }  
}
