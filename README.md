# julieops_demo

.
├── Jenkinsfile
├── README.md
├── checks
│   ├── verify-num-of-partitions.sh
│   └── verify-replication-factor.sh
├── descriptor.yaml
└── scripts
    └── build-connection-file.sh
    
    
`descriptor.yaml` — Declarative file that describes your topologies
`Jenkinsfile` — Declarative pipeline used by Jenkins for continuous delivery (CD)
`checks/verify-num-of-partitions.sh` — Bash script for verifying number of partitions matches required count. Declared as one of the stages in Jenkins pipeline.
`checks/verify-replication-factor.sh` — Bash script for verifying replication factor matches required count. Declared as one of the stages in Jenkins pipeline.
`scripts/build-connection-file.sh` — Bash script for building connection file to be used by AdminClient component in JulieOps. API key and secret are dynamically retrieved from Jenkins on the fly.
