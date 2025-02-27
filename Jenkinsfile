pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
        TERRAFORM_PATH     = 'C:\\Terraform\\terraform_1.10.5\\terraform.exe'
    }

    stages {
        stage('Terraform Init') {
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    powershell '''
                        Set-ExecutionPolicy Bypass -Scope Process -Force
                        [System.Environment]::SetEnvironmentVariable("AWS_ACCESS_KEY_ID", "$env:AWS_ACCESS_KEY_ID", "Process")
                        [System.Environment]::SetEnvironmentVariable("AWS_SECRET_ACCESS_KEY", "$env:AWS_SECRET_ACCESS_KEY", "Process")
                        & "$env:TERRAFORM_PATH" init
                        if ($LASTEXITCODE -ne 0) { exit 1 }
                    '''
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    powershell '''
                        [System.Environment]::SetEnvironmentVariable("AWS_ACCESS_KEY_ID", "$env:AWS_ACCESS_KEY_ID", "Process")
                        [System.Environment]::SetEnvironmentVariable("AWS_SECRET_ACCESS_KEY", "$env:AWS_SECRET_ACCESS_KEY", "Process")
                        & "$env:TERRAFORM_PATH" plan
                        if ($LASTEXITCODE -ne 0) { exit 1 }
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    powershell '''
                        [System.Environment]::SetEnvironmentVariable("AWS_ACCESS_KEY_ID", "$env:AWS_ACCESS_KEY_ID", "Process")
                        [System.Environment]::SetEnvironmentVariable("AWS_SECRET_ACCESS_KEY", "$env:AWS_SECRET_ACCESS_KEY", "Process")
                        & "$env:TERRAFORM_PATH" apply -auto-approve
                        if ($LASTEXITCODE -ne 0) { exit 1 }
                    '''
                }
            }
        }
    }  
}
