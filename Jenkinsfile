pipeline {

    agent {
      docker { image 'purbon/kafka-topology-builder:latest' }
    }

    parameters{
        string(name: 'TOPOLOGY', defaultValue: 'descriptor.yaml', description: 'Topology descriptor file')
        string(name: 'BROKERS', defaultValue: 'pkc-l9wvm.ap-southeast-1.aws.confluent.cloud:9092', description: 'Bootstrap server')
    }

   stages {
      stage('chmod-all-files') {
         steps {
            sh "chmod +x -R ${env.WORKSPACE}"
         }
      }
      stage('verify-replication-factor') {
         steps {
             sh "checks/verify-replication-factor.sh ${params.TOPOLOGY} 3"
         }
      }
      stage('verify-num-of-partitions') {
         steps {
            sh "checks/verify-num-of-partitions.sh ${params.TOPOLOGY} 4"
         }
      }
      stage('run') {
          steps {
            withCredentials([usernamePassword(credentialsId: 'confluent-cloud', usernameVariable: 'CLUSTER_API_KEY', passwordVariable: 'CLUSTER_API_SECRET')]) {
              sh './scripts/build-connection-file.sh > topology-builder.properties'
          }
              sh "kafka-topology-builder.sh  --brokers ${params.BROKERS} --clientConfig topology-builder.properties --topology ${params.TOPOLOGY} --allowDelete"
          }
      }
   }
}

