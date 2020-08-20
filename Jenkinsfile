pipeline {
	agent any
	stages {
                stage('checkout') {
    		echo 'Executing stage -- checkout --'
    		checkout scm
    		final scmVars = checkout(scm)
            BRANCH = scmVars.GIT_BRANCH
            echo "scmVars.GIT_BRANCH: $BRANCH"
    }

		stage("build"){
			steps {
				echo 'application building..'
			}
		}
		
		stage("test"){
                        steps {
                                echo 'application testing..'
                        }
                }

                stage("deploying"){
                        steps {
                                echo 'application deploying..'
                        }
                }


	}

}
