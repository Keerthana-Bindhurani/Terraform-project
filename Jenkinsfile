pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    options {
        timestamps() // Adds timestamps to logs
    }

    stages {
        stage('Cleanup Workspace') {
            steps {
                echo "Cleaning workspace..."
                deleteDir() // Ensures a fresh workspace
            }
        }

        stage('Checkout Code') {
            steps {
                echo "Cloning repository..."
                git branch: 'main', url: 'https://github.com/Keerthana-Bindhurani/Terraform-project.git'
            }
        }

        stage('Initialize Terraform') {
            steps {
                echo "Initializing Terraform..."
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    sh 'terraform init'
                }
            }
        }

        stage('Format Terraform') {
            steps {
                echo "Checking Terraform format..."
                sh 'terraform fmt -check'
            }
        }

        stage('Validate Terraform') {
            steps {
                echo "Validating Terraform configuration..."
                sh 'terraform validate'
            }
        }

        stage('Plan Terraform') {
            steps {
                echo "Generating Terraform plan..."
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Apply Terraform') {
            steps {
                echo "Applying Terraform configuration..."
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        always {
            echo "Cleaning up workspace after build..."
            deleteDir() // Cleanup after execution
        }

        success {
            echo "Terraform deployment completed successfully!"
        }

        failure {
            echo "Build failed. Check logs for errors."
        }
    }
}
