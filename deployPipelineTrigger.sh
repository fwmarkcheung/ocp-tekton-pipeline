
# Deploy the pipeline trigger

echo "Make sure to test the sonar is ready and listening for requests.  Otherwise, the mvn build will fail"
echo "Make sure the webhook is configred as well."
# Instruction to configure webhook
# https://redhat-scholars.github.io/openshift-starter-guides/rhs-openshift-starter-guides/4.7/nationalparks-java-pipeline-codechanges-github.html#configuring_github_webhooks
oc create -f tekton/triggerTemplate.yaml
