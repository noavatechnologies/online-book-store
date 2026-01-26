pipeline {
    agent any

    environment {
        APP_NAME = 'online-book-store'
        GIT_REPO_URL = 'https://github.com/noavatechnologies/online-book-store.git'
        GIT_BRANCH = 'staging'
    }

    stages {
        stage('Checkout') {
            steps {
                echo '========== Checking out from GitHub =========='
                git branch: '${GIT_BRANCH}', url: '${GIT_REPO_URL}'
            }
        }

        stage('Build') {
            steps {
                echo '========== Building application =========='
                dir('online-book-store') {
                    sh 'mvn clean package -DskipTests'
                }
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
