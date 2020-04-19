pipeline {
    agent any

    stages {
        stage('Prebuilt') {
            parallel{
                stage('Build dtc') { 
                    steps {
                        sh label: 'make dtc', script: '$WORKSPACE/build.sh makedtc'
                    }
                }
                stage('Build dtb') { 
                    steps {
                        sh label: 'make dtb', script: '$WORKSPACE/build.sh makedtb'
                    }
                }
            }
        }
        stage ('Build uefi fd') {
            steps {
                sh label: 'uefi', script: '$WORKSPACE/build.sh make_uefi_image'
            }
        }
        stage ('Build fake kernel') {
            steps {
                sh label: 'fakekernel', script: '$WORKSPACE/build.sh make_fake_kernel'
            }
        }
        stage ('Append kernel DTB') {
            steps {
                sh label: 'appenddtb', script: '$WORKSPACE/build.sh appenddtb'
            }
        }
        stage('Clean') {
            steps {
                sh label: 'Clean workspace', script: '$WORKSPACE/build.sh clean'
            }
        }
    }
}
