pipeline {
    agent any

    environment {
        APP_NAME = 'online-book-store'
    }

    stages {

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
