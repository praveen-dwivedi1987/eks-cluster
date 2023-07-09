pipeline{
    agent any
    
    parameters {
  string defaultValue: 'us-east-1', description: 'default region', name: 'DEFAULT_REGION'
  string defaultValue: 'us-east-1', description: 'AWS_ACCESS_KEY_ID', name: 'ACCESS_KEY_ID'
  string defaultValue: 'us-east-1', description: 'SECRET_ACCESS_KEY', name: 'SECRET_ACCESS_KEY'
}
    
    environment {
  AWS_DEFAULT_REGION = "$DEFAULT_REGION"
  AWS_ACCESS_KEY_ID = "$ACCESS_KEY_ID"
  AWS_SECRET_ACCESS_KEY = "$SECRET_ACCESS_KEY"
}
    stages{
        stage('git checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/praveen-dwivedi1987/eks-cluster.git'
            }
        }

        stage('create s3 bucket'){
            steps{
                sh '''aws s3 ls praveen-tfstate-bucket-00001
                StsChk=`echo $?`
                if (( $? == 0 ));
                then
                echo "bucket already exist";
                else
                aws s3api create-bucket --bucket praveen-tfstate-bucket-00001
                fi'''
            }
        }

        stage('terraform init'){
            steps{
                sh '''cd Terraform-EKS-Project/
                terraform init'''
            }
        }

        stage('terraform fmt & validate'){
            steps{
                sh '''cd Terraform-EKS-Project/
                terraform fmt
                terraform validate'''
            
                
            }
        }


        stage ('terraform plan & apply '){
            
            steps{
                sh '''cd Terraform-EKS-Project/
                terraform apply -auto-approve'''
            }
        }
    }
    
}