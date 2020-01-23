parameters {
        string(name: 'branch', defaultValue: 'master', description: 'branch to test')		
		string(name: 'testServerUrl', defaultValue: 'https://api-qa.groupdocs.cloud', description: 'server url')		
}

def runtests(dockerImageVersion)
{
    dir(dockerImageVersion){
        try {
            stage('checkout'){
				checkout([$class: 'GitSCM', branches: [[name: params.branch]], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'LocalBranch', localBranch: "**"]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '361885ba-9425-4230-950e-0af201d90547', url: 'https://git.auckland.dynabic.com/assembly-cloud/assembly-ruby-sdk.git']]])
                withCredentials([usernamePassword(credentialsId: '82329510-1355-497f-828a-b8ff8b5f6a30', passwordVariable: 'AppKey', usernameVariable: 'AppSid')]) {
					sh 'mkdir -p Settings'
                    sh 'echo "{\\"AppSid\\": \\"$AppSid\\",\\"AppKey\\": \\"$AppKey\\", \\"BaseUrl\\": \\"$testServerUrl\\"}" > Settings/servercreds.json'
                }
            }
            
            docker.image('ruby:' + dockerImageVersion).inside('-u root'){
                stage('build'){
                    sh "export DEBIAN_FRONTEND=noninteractive"
                    sh "apt-get -yq update"
                    sh "apt -yq install zip unzip"
                    sh "mkdir testReports"
                    sh "gem install bundler && bundle install"
                }
            
                stage('tests'){   
					try{
						sh 'rake test'
					} finally{
						junit 'testReports/report/*.xml'
					}
                }
            
                stage('bdd-tests'){
					
                }
				
				stage('clean-compiled'){
					sh "rm -rf %s"
				}
            }        
        } finally {
			cleanWs()
        }
    }
}

node('words-linux') {        
    stage('ruby'){
		try {
			runtests("latest")
		} finally {
			cleanWs()
		}
	}
}