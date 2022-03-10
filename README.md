# ocp-tekton-pipeline

Project setup
-----------------
execute projectSetup.sh


To run the pipeline manually using pipeline-run, execute

executePipeline.sh

To trigger the pipeline through git commit:
------------------------------------------
1. Setup the webhook
2. deployPipelineTrigger.sh
3. Then commit a change and see pipeline should be triggered automatically


Demo HorizontalPodAutoscalers
-----------------------------

Create a HorizontalPodAutoscalers


oc project mark-config-map-dev
oc autoscale deployment/mark-demo --min=2 --max=3 --cpu-percent=75


oc autoscale deployment/mark-demo --min=2 --max=3 --cpu-percent=75

Use a simple load generator - hey to send 10000 requests (-n)  through 1000 connections

hey -n 10000 -c 1000 http://mark-demo-mark-config-map-dev.apps.rhcasalab.sandbox1385.opentlc.com/greet/mark

Look at the cpu  usage to go over 75%.  A new pod will be created

https://console-openshift-console.apps.rhcasalab.sandbox1385.opentlc.com/k8s/ns/mark-config-map-dev/horizontalpodautoscalers/mark-demo

