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
		releaseVersion = 'latest'
            }
            steps {
                sh """
                echo "Executing stage -- nexus --"
                """

                sh """
                echo "Executing stage -- sonarqube --"
                """
            }
        }

        stage('release') {
            when {
                branch 'master'
            }
            steps {
		script {
                        developmentVersion  = readMavenPom().getVersion()
                        releaseVersion = developmentVersion.replace('-SNAPSHOT', '')
                	sh """
                        echo "developmentVersion: ${developmentVersion}"
                	echo "releaseVersion: ${releaseVersion}"
                	echo "Executing stage -- release --"
                }   	"""

            }
        }


    }   
}
