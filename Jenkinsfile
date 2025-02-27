pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'ap-south-1'
        TF_WORKING_DIR        = "C:\\terraform_project"
        TERRAFORM_PATH        = "C:\\Terraform\\terraform_1.10.5_windows_amd64 (2)\\terraform.exe"
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
                    bat """
                        cd ${env.TF_WORKING_DIR}
                        \"${env.TERRAFORM_PATH}\" init
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline execution completed successfully!'
        }
        failure {
            echo 'Pipeline execution failed. Check logs for errors.'
        }
    }
}
