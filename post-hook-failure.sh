curl "https://api.github.com/repos/hiimivantang/kdb-demo/statuses/$GITHUB_PR_HEAD_SHA?access_token=$GITHUB_TOKEN" \
      -H "Content-Type: application/json" \
        -X POST \
          -d "{\"state\": \"failure\",\"context\": \"topology-builder-pipeline-verify\", \"description\": \"Jenkins\", \"target_url\": \"http://ec2-54-179-227-183.ap-southeast-1.compute.amazonaws.com:8081/job/topology-builder-pipeline-verify/$BUILD_NUMBER/console\"}"

exit 1
