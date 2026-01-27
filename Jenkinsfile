pipeline {
    agent any

    tools {
        maven 'maven3.9.12'
    }

    environment {
        APP_NAME = 'online-book-store'
        SONAR_PROJECT_KEY = 'online-book-store'
        NEXUS_URL = 'http://<NEXUS_HOST>:8081'
        NEXUS_REPO = 'maven-releases'
        TOMCAT_URL = 'http://<TOMCAT_HOST>:8080'
    }

    stages {

        stage('Checkout') {
            steps {
                echo '========== Checking out source code =========='
                git branch: 'test',
                    url: 'https://github.com/noavatechnologies/online-book-store.git'
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

        stage('Publish to Nexus') {
            steps {
                echo '========== Publishing Artifact to Nexus =========='
                withCredentials([usernamePassword(
                    credentialsId: 'NEXUS-CRED',
                    usernameVariable: 'NEXUS_USER',
                    passwordVariable: 'NEXUS_PASS'
                )]) {
                    sh """
                        mvn deploy -DskipTests \
                        -Dnexus.username=$NEXUS_USER \
                        -Dnexus.password=$NEXUS_PASS
                    """
                }
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                echo '========== Deploying to Tomcat =========='
                withCredentials([usernamePassword(
                    credentialsId: 'JENKINS-TOMCAT-CRED',
                    usernameVariable: 'TOMCAT_USER',
                    passwordVariable: 'TOMCAT_PASS'
                )]) {
                    sh """
                        curl -v -u $TOMCAT_USER:$TOMCAT_PASS \
                        -T target/${APP_NAME}.war \
                        "$TOMCAT_URL/manager/text/deploy?path=/${APP_NAME}&update=true"
                    """
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
