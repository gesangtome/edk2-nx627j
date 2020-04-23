pipeline {
    agent any

    stages {
        stage('Build dtc') { 
            steps {
                sh label: 'make dtc', script: '$WORKSPACE/build.sh makedtc'
            }
        }
        stage('Make dtb') { 
            steps {
                sh label: 'make dtb', script: '$WORKSPACE/build.sh makedtb'
            }
        }
        stage ('Build bios') {
            steps {
                sh label: 'makebios', script: '$WORKSPACE/build.sh make_uefi_image'
            }
        }
        stage ('Build kernel') {
            steps {
                sh label: 'fakekernel', script: '$WORKSPACE/build.sh make_fake_kernel'
            }
        }
        stage ('Append DTB') {
            steps {
                sh label: 'appenddtb', script: '$WORKSPACE/build.sh appenddtb'
            }
        }
        stage ('Make image') {
            steps {
                sh label: 'makeuefi', script: '$WORKSPACE/build.sh androidboot'
            }
        }
        stage('Save image') {
            steps {
                archiveArtifacts 'nubia-Z20_edk2-uefiboot.img'
            }
        }
        stage('Cleaning') {
            steps {
                sh label: 'Cleaning workspace', script: '$WORKSPACE/build.sh clean'
            }
        }
    }
}
