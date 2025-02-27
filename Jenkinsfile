pipeline {
    agent any

    environment {
        TF_WORKING_DIR = "C:\\terraform_project" // Adjust as needed
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
