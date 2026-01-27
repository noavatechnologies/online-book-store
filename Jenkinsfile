pipeline {
    agent any

    tools {
        maven 'maven3.9.12'
    }

    environment {
        APP_NAME = 'online-book-store'
        SONAR_PROJECT_KEY = 'online-book-store'
    }

    stages {

        stage('Checkout') {
            steps {
                echo '========== Checking out source code =========='
                git branch: 'staging', url: 'https://github.com/noavatechnologies/online-book-store.git'
            }
        }

        stage('Build') {
            steps {
                echo '========== Building application =========='
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo '========== Running SonarQube Analysis =========='
                withSonarQubeEnv('sonarqube-server') {
                    sh """
                        mvn sonar:sonar \
                        -Dsonar.projectKey=${SONAR_PROJECT_KEY} \
                        -Dsonar.projectName=${APP_NAME}
                    """
                }
            }
        }

        stage('Quality Gate') {
            steps {
                echo '========== Checking Quality Gate =========='
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }

    post {
        always {
            echo '========== Pipeline Finished =========='
        }
        success {
            echo '========== Pipeline Successful =========='
        }
        failure {
            echo '========== Pipeline Failed =========='
        }
    }
}
