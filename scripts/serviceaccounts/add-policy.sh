#! /bin/bash

# Add a policy binding to the given service account in the current project.
# - $1: The name of the service account.
# - $2: The project ID.
# - $3: The role to add.

gcloud projects add-iam-policy-binding "${2}" \
    --member="serviceAccount:${1}@${2}.iam.gserviceaccount.com" \
    --role="${3}"
