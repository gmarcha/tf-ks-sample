#! /bin/bash

# Create a service account with the given name in the current project,
# then add the given policies to it,
# then create a json key file for using it.

if [ $# -ne 2 ]; then
  echo "Usage: $0 <service-account-name> <project-id>"
  exit 1
fi

# - $1: The name of the service account.
# - $2: The project ID.

printf "\nCreating service account...\n"
bash scripts/serviceaccounts/create.sh "$1"

printf "\nAdding policies...\n"
bash scripts/serviceaccounts/add-policies.sh "$1" "$2"

printf "\nCreating key...\n"
bash scripts/serviceaccounts/create-key.sh "$1" "$2"
