# Create the projects

oc new-project mark-config-map-dev
oc new-project mark-config-map-prod
oc new-project mark-pipeline-demo


# Create dev project artifacts and grant permission
oc project mark-config-map-dev
oc policy add-role-to-user system:image-puller system:serviceaccount:mark-config-map-dev:default -n mark-pipeline-demo
oc apply -f dev -R

# Create prod project artifacts and grant permission
oc project mark-config-map-prod
oc policy add-role-to-user system:image-puller system:serviceaccount:mark-config-map-prod:default -n mark-pipeline-demo
oc apply -f prod -R

# Create pipeline project artifacts and grant permission
oc project mark-pipeline-demo
oc policy add-role-to-user admin system:serviceaccount:mark-pipeline-demo:pipeline -n mark-config-map-dev
oc policy add-role-to-user admin system:serviceaccount:mark-pipeline-demo:pipeline -n mark-config-map-prod
oc apply -k tekton

# oc apply -f 01-workspace-pvc.yaml
# oc apply -f 02-pipeline.yaml

# Deploy sonarqube in the mark-pipeline-demo project
oc apply -k cicd-tools

# Start the pipeline
# Need to make sure the sonar server is listening before running
sleep 60

oc create -f build-and-rollout-pipeline-run.yaml
