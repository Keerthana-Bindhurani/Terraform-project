pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'ap-south-1'
    }

    stages {
        stage('Terraform Init') {
            steps {
                powershell 'terraform init'
            }
        }

        stage('Plan') {
            steps {
                powershell 'terraform plan'
            }
        }

        stage('Apply') {
            steps {
                powershell 'terraform apply -auto-approve'
            }
        }
    }
}
