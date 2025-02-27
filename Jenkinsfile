pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
        TERRAFORM_PATH     = 'C:\\Terraform\\terraform_1.10.5\\terraform.exe'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Keerthana-Bindhurani/Terraform-project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    powershell '''
                        Set-ExecutionPolicy Bypass -Scope Process -Force
                        $env:AWS_ACCESS_KEY_ID = "$env:AWS_ACCESS_KEY_ID"
                        $env:AWS_SECRET_ACCESS_KEY = "$env:AWS_SECRET_ACCESS_KEY"
                        & "$env:TERRAFORM_PATH" init -reconfigure
                        if ($LASTEXITCODE -ne 0) { exit 1 }
                    '''
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    powershell '''
                        & "$env:TERRAFORM_PATH" validate
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
                    catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                        powershell '''
                            $env:AWS_ACCESS_KEY_ID = "$env:AWS_ACCESS_KEY_ID"
                            $env:AWS_SECRET_ACCESS_KEY = "$env:AWS_SECRET_ACCESS_KEY"
                            & "$env:TERRAFORM_PATH" plan -out=tfplan
                            if ($LASTEXITCODE -ne 0) { exit 1 }
                        '''
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                        powershell '''
                            $env:AWS_ACCESS_KEY_ID = "$env:AWS_ACCESS_KEY_ID"
                            $env:AWS_SECRET_ACCESS_KEY = "$env:AWS_SECRET_ACCESS_KEY"
                            & "$env:TERRAFORM_PATH" apply -auto-approve tfplan
                            if ($LASTEXITCODE -ne 0) { exit 1 }
                        '''
                    }
                }
            }
        }
    }
}
