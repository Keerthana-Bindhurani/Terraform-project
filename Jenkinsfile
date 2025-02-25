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
        stage('Checkout Code') {
            steps {
                script {
                    echo "Cloning repository..."
                    git branch: 'main', 
                        url: 'https://github.com/Keerthana-Bindhurani/Terraform-project.git', 
                        credentialsId: 'github-credentials-id'  // 🔹 Replace with your actual credentials ID
                }
            }
        }

        stage('Initialize Terraform') {
            steps {
                powershell '''
                    echo "Initializing Terraform..."
                    terraform init
                '''
            }
        }

        stage('Validate Terraform') {
            steps {
                powershell '''
                    echo "Validating Terraform configuration..."
                    terraform validate
                '''
            }
        }

        stage('Plan Terraform') {
            steps {
                powershell '''
                    echo "Generating Terraform plan..."
                    terraform plan -out=tfplan -input=false
                '''
            }
        }

        stage('Apply Terraform') {
            steps {
                powershell '''
                    echo "Applying Terraform changes..."
                    terraform apply -auto-approve -input=false
                '''
            }
        }
    }

    post {
        always {
            echo "⚡ Terraform pipeline execution completed."
        }
        success {
            echo "✅ Terraform applied successfully!"
        }
        failure {
            echo "❌ Terraform pipeline failed! Check logs."
        }
    }
}
