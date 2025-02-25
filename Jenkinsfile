pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    options {
        timestamps() // Adds timestamps for better logging
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

        stage('Install Terraform') {
            steps {
                script {
                    echo "Checking if Terraform is installed..."
                    def terraformInstalled = sh(script: 'command -v terraform', returnStatus: true) == 0
                    if (!terraformInstalled) {
                        echo "Terraform not found. Installing..."
                        sh '''
                            sudo apt-get update
                            sudo apt-get install -y software-properties-common
                            sudo apt-add-repository --yes --update ppa:terraform-latest/ppa
                            sudo apt-get install -y terraform
                        '''
                    } else {
                        echo "Terraform is already installed."
                    }
                    sh 'terraform --version'
                }
            }
        }

        stage('Initialize Terraform') {
            steps {
                script {
                    echo "Initializing Terraform..."
                    sh 'terraform init'
                }
            }
        }

        stage('Validate Terraform') {
            steps {
                script {
                    echo "Validating Terraform configuration..."
                    sh 'terraform validate'
                }
            }
        }

        stage('Plan Terraform') {
            steps {
                script {
                    echo "Generating Terraform plan..."
                    sh 'terraform plan -out=tfplan -input=false'
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                script {
                    echo "Applying Terraform changes..."
                    sh 'terraform apply -auto-approve -input=false'
                }
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
