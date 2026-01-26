pipeline {
    agent any

    tools {
        maven 'maven3.9.12'
    }

    environment {
        APP_NAME = 'online-book-store'
    }

    stages {

        stage('Checkout') {
            steps {
                echo '========== Checking out source code =========='
                git branch: 'staging',
                    url: 'https://github.com/noavatechnologies/online-book-store.git'
            }
        }

        stage('Build') {
            steps {
                echo '========== Building application =========='
                sh 'mvn clean package -DskipTests'
            }
        }
    }

    post {
        always {
            echo '========== Build Complete =========='
        }
        success {
            echo '========== Build Successful =========='
        }
        failure {
            echo '========== Build Failed =========='
        }
    }
}
