
# Start the pipeline

echo "Make sure to test the sonar is ready and listening for requests.  Otherwise, the mvn build will fail"

oc create -f tekton/build-and-rollout-pipeline-run.yaml
