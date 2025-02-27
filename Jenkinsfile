pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'ap-south-1'
        TERRAFORM_PATH        = 'C:\\terraform\\terraform.exe'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Keerthana-Bindhurani/Terraform-project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                powershell 'Set-ExecutionPolicy Bypass -Scope Process -Force'
                powershell '& "$env:TERRAFORM_PATH" init; if ($LASTEXITCODE -ne 0) { exit 1 }'
            }
        }

        stage('Terraform Validate') {
            steps {
                powershell '& "$env:TERRAFORM_PATH" validate; if ($LASTEXITCODE -ne 0) { exit 1 }'
            }
        }

        stage('Terraform Plan') {
            steps {
                powershell '& "$env:TERRAFORM_PATH" plan -out=tfplan; if ($LASTEXITCODE -ne 0) { exit 1 }'
            }
        }

        stage('Terraform Apply') {
            steps {
                powershell '& "$env:TERRAFORM_PATH" apply -auto-approve tfplan; if ($LASTEXITCODE -ne 0) { exit 1 }'
            }
        }
    }
}
