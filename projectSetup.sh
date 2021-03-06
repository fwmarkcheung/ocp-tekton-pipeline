# Create the projects

oc new-project mark-config-map-dev
oc new-project mark-config-map-prod
oc new-project mark-pipeline-demo
oc new-project mark-cicd-tools

# Deploy cicd tools in mark-cicd-tools project which can be shared with other projects
oc apply -k cicd-tools

# Create dev project artifacts and grant permission
oc project mark-config-map-dev
oc policy add-role-to-user system:image-puller system:serviceaccount:mark-config-map-dev:default -n mark-pipeline-demo
oc apply -k sample-app/overlays/dev

# Create prod project artifacts and grant permission
oc project mark-config-map-prod
oc policy add-role-to-user system:image-puller system:serviceaccount:mark-config-map-prod:default -n mark-pipeline-demo
oc apply -k sample-app/overlays/prod

# Create pipeline project artifacts and grant permission
oc project mark-pipeline-demo
oc policy add-role-to-user admin system:serviceaccount:mark-pipeline-demo:pipeline -n mark-config-map-dev
oc policy add-role-to-user admin system:serviceaccount:mark-pipeline-demo:pipeline -n mark-config-map-prod
oc apply -k tekton

# Create the config and secret for pipeline to access these tools
oc apply -k tekton/cicd-tools-config
