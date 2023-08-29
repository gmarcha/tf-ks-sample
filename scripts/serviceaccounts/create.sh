#! /bin/bash

# Create a service account in the current project with the given name.
# - $1: The name of the service account.

gcloud iam service-accounts create $1 \
  --display-name $1
