#! /bin/bash

# Add policies binding to the given service account in the current project.
# - $1: The name of the service account.
# - $2: The project ID.


# Required for Terraform GCP Network module.
bash scripts/serviceaccounts/add-policy.sh > /dev/null "${1}" "${2}" "roles/compute.networkAdmin"

# Required for Terraform GKE module.
bash scripts/serviceaccounts/add-policy.sh > /dev/null "${1}" "${2}" "roles/iam.serviceAccountAdmin"
bash scripts/serviceaccounts/add-policy.sh > /dev/null "${1}" "${2}" "roles/iam.serviceAccountUser"
bash scripts/serviceaccounts/add-policy.sh > /dev/null "${1}" "${2}" "roles/container.clusterAdmin"
bash scripts/serviceaccounts/add-policy.sh > /dev/null "${1}" "${2}" "roles/container.developer"
bash scripts/serviceaccounts/add-policy.sh > /dev/null "${1}" "${2}" "roles/compute.viewer"
bash scripts/serviceaccounts/add-policy.sh > /dev/null "${1}" "${2}" "roles/compute.securityAdmin"
bash scripts/serviceaccounts/add-policy.sh > /dev/null "${1}" "${2}" "roles/resourcemanager.projectIamAdmin"

# Required for Terraform KubeSphere Helm release.
# - permissions: ["container.clusterRoles.create", "container.clusterRoleBindings.create"]
bash scripts/serviceaccounts/add-policy.sh > /dev/null "${1}" "${2}" "roles/container.admin"
