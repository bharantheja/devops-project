pipeline {
    agent any

    stages {

        stage("Get Code") {
            steps {
                git branch: "main", url: "https://github.com/saitheja/simple-devops-app.git"
            }
        }

        stage("Install") {
            steps {
                sh "pip3 install -r requirements.txt"
            }
        }

        stage("Test") {
            steps {
                sh "python3 -m py_compile app.py"
                echo "App is OK"
            }
        }

        stage("Build Docker Image") {
            steps {
                sh "docker build -t simple-devops-app ."
            }
        }

        stage("Run Container") {
            steps {
                sh "docker stop simple-devops-app || true"
                sh "docker rm   simple-devops-app || true"
                sh "docker run -d --name simple-devops-app -p 5000:5000 simple-devops-app"
            }
        }
    }

    post {
        success { echo "Pipeline Done! App is running on port 5000." }
        failure { echo "Something went wrong. Check the logs." }
    }
}
