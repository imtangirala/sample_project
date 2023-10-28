pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.2.0'
            args  '--entrypoint="" -u root -v /opt/jenkins/.aws:/root/.aws -v /tmp:/root/'
        }
    }

    parameters {
        choice(
            choices: ['plan' , 'apply', 'validate', 'destroy'],
            description: 'Terraform action to apply',
            name: 'action')
        string(defaultValue: "default", description: 'Which AWS Account (Boto profile) do you want to target?', name: 'AWS_PROFILE')
        string(name: 'machine_name', description: 'This is the tag')
        string(name: 'os', description: 'This is the tag')
        string(name: 'ami', description: 'AMI to use for the instance. Required unless launch_template is specified and the Launch Template specifies an AMI. If an AMI is specified in the Launch Template, the setting ami will override the AMI specified in the Launch Template')
	string(name: 'counts', description: 'Number of instances to be created')
	string(name: 'instance_type', description: 'Instance type to use for the instance. ')
	string(name: 'subnet_id', description: 'VPC Subnet ID to launch in.')
	string(name: 'key_name', description: 'Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource.')
	string(name: 'vpc_security_group_ids', description: 'paste it in list format example: ["sg-0ff3"]' )
	string(name: 'volume_size', description: 'Size of the volume in gibibytes')
	string(name: 'tfstate_key', description: 'File Name which will store the state on S3')

    }

    stages {

        stage('checkout code') {
        steps {
            checkout scm
            sh 'ls'
            sh 'cp -r . /tmp'
        }
    }
        stage('init') {
            steps {
                sh 'pwd'
                sh 'terraform version'
                sh 'terraform init -reconfigure -backend-config="key=${tfstate_key}/terraform.tfstate"'
            }
        }

        stage('plan') {
            when {
                expression { params.action == 'plan' }
            }
            steps {
		sh 'terraform plan -var ami="$ami"  -var instance_type="$instance_type" -var subnet_id="$subnet_id" -var key_name="$key_name" -var counts=$counts -var  vpc_security_group_ids="$vpc_security_group_ids"'
            }
        }

        stage('apply') {
            when {
                expression { params.action == 'apply' }
            }
            steps {
                sh 'terraform apply -var ami="$ami"  -var instance_type="$instance_type" -var subnet_id="$subnet_id" -var key_name="$key_name" -var counts=$counts -var  vpc_security_group_ids="$vpc_security_group_ids" -var machine_name="$machine_name" -var os=$os  -auto-approve'
            }
        }

        stage('validate') {
            when {
                expression { params.action == 'validate' }
            }
            steps {
                sh 'terraform validate'
            }
        }

        stage('destroy') {
            when {
                expression { params.action == 'destroy' }
            }
            steps {
		sh 'terraform destroy -var ami="$ami"  -var instance_type="$instance_type" -var subnet_id="$subnet_id" -var key_name="$key_name" -var counts=$counts -var  vpc_security_group_ids="$vpc_security_group_ids"  -auto-approve'
            }
        }
    }
}