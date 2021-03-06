pipeline {

    agent any

    options {
        buildDiscarder logRotator(
                    daysToKeepStr: '16',
                    numToKeepStr: '7'
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

        stage('develop-release') {
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

        stage('master-release') {
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

        stage("docker") {
            steps {
                script {
                    if(BRANCH_NAME == 'develop') {
                        def releaseVersion  = "latest"
                        echo "${releaseVersion}"
                    }
                    else if(BRANCH_NAME == 'master') {
                        developmentVersion = readMavenPom().getVersion()
                        releaseVersion = developmentVersion.replace('-SNAPSHOT', '')
                        echo "${releaseVersion}"
                    }
                }
           }
       }



    }
}


