pipeline {
    agent any

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
}
