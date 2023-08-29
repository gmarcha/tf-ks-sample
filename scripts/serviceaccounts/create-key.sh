#! /bin/bash

# Create a key for the given service account in the current project (i.e. a credentials file).

# - $1: The name of the service account.
# - $2: The project ID.

gcloud iam service-accounts keys create "provision/credentials/${1}.json" \
    --iam-account="${1}@${2}.iam.gserviceaccount.com"
