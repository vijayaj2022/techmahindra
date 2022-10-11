node {
    
    properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), pipelineTriggers([githubPush()])])
    def maven_home = tool name: "MAVEN_HOME"
    stage ('clone') {
       git branch: 'develop', credentialsId: 'github', url: 'https://github.com/narayana3619/tech_mahindra.git' 
    }
    
    stage ('build') {
        sh "${maven_home}/bin/mvn clean package"
    }
    
    stage ('sonar') {
        sh "${maven_home}/bin/mvn sonar:sonar"
    }
    
    stage ('nexus') {
        sh "${maven_home}/bin/mvn deploy"
    }
    
    stage ('tomcat') {
        
        sshagent(['b38facf8-9203-4ed2-a3cd-4b754e55fd6d']) {
            sh "scp -o StrictHostKeyChecking=no target/*.war ec2-user@13.235.245.223:/opt/tomcat/webapps"
            
        }
    }
    
    stage ('mail') {
        emailext body: 'build over scripted way', subject: 'build-over scripted way', to: 'swamy.visit@gmail.com'
    }
}

