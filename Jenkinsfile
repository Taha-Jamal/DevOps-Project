pipeline {
  agent any

  environment {
    ANSIBLE_HOST_KEY_CHECKING = "False"
  }

  stages {
    stage('Terraform: Init & Apply') {
      steps {
        dir('terraform') {
          sh 'terraform init'
          sh 'terraform apply -auto-approve'
        }
      }
    }

    stage('Ansible: Configure Server') {
      steps {
        dir('ansible') {
          sh 'chmod +x inventory.sh'
          sshagent (credentials: ['aws-ssh-key']) {
            sh 'ansible-playbook -i inventory.sh install_web.yml -u ubuntu'
          }
        }
      }
    }

    stage('Verify Deployment') {
      steps {
        script {
          def ip = sh(script: "cd terraform && terraform output -raw instance_public_ip", returnStdout: true).trim()
          sh "curl http://${ip}"
        }
      }
    }
  }
}
