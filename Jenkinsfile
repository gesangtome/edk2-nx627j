pipeline
{
    agent any

    environment
    {
        LANG = 'en_US.UTF-8'
    }

    options
    {
        timeout(activity: true, time: 65)
    }

    stages
    {
        stage('build dtc')
        { 
            steps
            {
                sh label: '', script: 'bash build.sh makedtc'
            }
        }
        stage('build dtb')
        { 
            steps
            {
                sh label: '', script: 'bash build.sh makedtb'
            }
        }
        stage ('build uefi fv')
        {
            steps
            {
                sh label: '', script: 'bash build.sh make_uefi_image'
            }
        }
        stage ('build kernel')
        {
            steps
            {
                sh label: '', script: 'bash build.sh make_fake_kernel'
            }
        }
        stage ('append dtb')
        {
            steps
            {
                sh label: '', script: 'bash build.sh appenddtb'
            }
        }
        stage ('build image')
        {
            steps
            {
                sh label: '', script: 'bash build.sh androidboot'
            }
        }
    }
    post
    {
        success
        {
            archiveArtifacts artifacts: 'nubia-Z20_edk2-uefiboot.img', fingerprint: true, onlyIfSuccessful: true
            sh label: 'Cleaning workspace', script: '$WORKSPACE/build.sh clean'
        }
    }
}
