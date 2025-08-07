pipeline {
    agent any
    
    stages {
        stage('git checkout') {
            steps {
                git 'https://github.com/Shantanu26590/myrepo.git'
            }
        }
        stage('Terraform-init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Do you want to apply the Terraform plan?'
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}

