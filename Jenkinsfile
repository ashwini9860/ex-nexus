pipeline {

    agent any

    options {
        buildDiscarder logRotator(
                    daysToKeepStr: '16',
                    numToKeepStr: '10'
            )
    }

    stages {

        stage('Cleanup Workspace') {
            steps {
                cleanWs()
                sh """
                echo "Cleaned Up Workspace For Project"
                """
            }
        }


        stage('Checkout SCM') {
            steps {
                echo 'Pulling...' + env.BRANCH_NAME
                checkout scm
            }
        }


        stage('build') {
            steps {
                sh """
                echo "Executing stage -- build --"
                """
            }
        }

        stage('acceptance') {
            steps {
                sh """
                echo "Executing stage -- acceptance --"
                """
            }
        }

        stage('nexus/sonarqube') {
            when {
                branch 'develop'
            }
            steps {
                script {
                   def releaseVersion  = "latest"
                   sh """
                   echo ${releaseVersion}
                   echo "Executing stage -- nexus --"
                   echo "Executing stage -- sonarqube --"
                   """
                }
            }
        }

        stage('nexus/sonarqube') {
            when {
                branch 'master'
            }
            steps {
                script {
                   developmentVersion = readMavenPom().getVersion()
            	   releaseVersion = developmentVersion.replace('-SNAPSHOT', '')
                   sh """
                   echo ${releaseVersion}
                   echo "Executing stage -- nexus --"
                   echo "Executing stage -- sonarqube --"
                   """
                }
            }
        }



    }
}

