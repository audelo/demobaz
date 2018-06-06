node('gradle') {
        stage('Build Artifacto (JAR)') 
        {
            
                git url: "https://github.com/audelo/demobaz.git"
                sh "./gradlew build --stacktrace"
                sh 'jarFile=`ls build/libs | grep -v original` && mkdir -p ocp/deployments && cp build/libs/$jarFile ocp/deployments/'
            
        }
        stage('Build image for Docker') 
        {

                script {
                    openshift.withCluster() {
                        openshift.withProject('demobaz-env-qa') {
                            // create docker build
                            def buildTemplate = readYaml file: 'openshift/demobaz-docker-build.yml'
                            def resources = openshift.process(buildTemplate)
                            def buildCfg = openshift.apply(resources).narrow('bc')
                            // create app template
                            def template = readYaml file: 'openshift/demobaz-template.yml'
                            openshift.apply(openshift.process(template))

                            def buildSelector = buildCfg.startBuild('--from-dir=ocp')
                            timeout(5) {
                                buildSelector.untilEach(1) {
                                    return it.object().status.phase == "Complete"
                                }
                            }
                        }
                    }
                }
            
        }
        stage('QA') 
        {
            agent { label 'gradle' }
            steps {
                script {
                    openshift.withCluster() {
                        openshift.tag("dev/demobaz:latest", "staging/demobaz:latest")
                        openshift.withProject('demobaz-env-qa') {
                            def template = readYaml file: 'openshift/demobaz-template.yml'
                            openshift.apply(openshift.process(template, "-p", "VERSION=latest"))
                            openshiftVerifyDeployment depCfg: "demo", namespace: "demobaz-env-qa"
                        }
                    }
                }
            }
        }
        stage('Approve') 
        {
            agent none
            steps {
                input "Does the staging environment look ok ?"
            }
        }
        stage('Prod') 
        {
            agent { label 'gradle' }
            steps {
                script {
                    openshift.withCluster() {
                        openshift.tag("staging/demobaz:latest", "prod/demobaz:latest")
                        openshift.withProject('demobaz-env-prod') {
                            def template = readYaml file: 'openshift/demobaz-template.yml'
                            openshift.apply(openshift.process(template, "-p", "VERSION=latest"))
                            openshiftVerifyDeployment depCfg: "demobaz", namespace: "demobaz-env-prod"
                        }
                    }
                }
            }
        }
    }


/home/jenkins/workspace/cicd/cicd-demobaz-pipeline
  