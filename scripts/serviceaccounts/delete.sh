#! /bin/bash

# Create a service account in the current project with the given name.
# - $1: The name of the service account.
# - $2: The project ID.

gcloud iam service-accounts delete "${1}@${2}.iam.gserviceaccount.com"
