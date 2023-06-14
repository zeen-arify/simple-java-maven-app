node {
    docker.image('maven:3.9.0').inside('-v /root/.m2:/root/.m2') {
        stage('Build') {
            sh 'mvn -B -DskipTests clean package'
        }
        stage('Test') {
            sh 'mvn test'
            junit 'target/surefire-reports/*.xml'
        }
	
	stage('Manual Approval') {
            input(message: 'Lanjutkan ke tahap Deploy?', ok: 'Proceed', submitter: 'user')
        }

	stage('Deploy') {
            sh './jenkins/scripts/deliver.sh'
	    sleep(time: 1, unit: 'MINUTES')
        }
    }
}
