#! /bin/bash

# Create a service account with the given name in the current project,
# then add the given policies to it,
# then create a json key file for using it.

# - $1: The name of the service account.
# - $2: The project ID.

bash scripts/serviceaccounts/create.sh "$1"
bash scripts/serviceaccounts/add-policies.sh "$1" "$2"
bash scripts/serviceaccounts/create-key.sh "$1" "$2"
