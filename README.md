# tf-ks-sample

An IaC to bootstrap KubeSphere on GKE with Terraform.

## Requirements

- `terraform` cli[^1],
- `gcloud` cli[^2].

## Usage

Login to Google Cloud Platform with `gcloud` cli.

```bash
gcloud auth login
gcloud config set project "${PROJECT_ID}"
```

Create a `credentials.json` file from a GCP service account configured with necessary permissions[^3] (see `/scripts/serviceaccount.sh`),
- roles/iam.serviceAccountAdmin,
- roles/iam.serviceAccountUser,
- roles/container.clusterAdmin,
- roles/container.developer,
- roles/compute.networkAdmin,
- roles/compute.viewer,
- roles/compute.securityAdmin[^4],
- roles/resourcemanager.projectIamAdmin[^5].

Configure project variables directly in an interactive fashion by running Terraform CLI,
or replace values in `provision/gcp-gke/terraform.tfvars.sample` and rename file to `terraform.tfvars`.

```bash
cd provision/gcp-gke
terraform init
terraform plan
```
```bash
terraform apply
```
```bash
terraform destroy
```

## Documentation

- Terraform Google Cloud Platform (GCP) Network module [documentation](https://registry.terraform.io/modules/terraform-google-modules/network/google/latest)
- Terraform Google Kubernetes Engine (GKE) module [documentation](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest)

[^1]: see Terraform [documentation](https://developer.hashicorp.com/terraform/downloads) or Docker [image](https://hub.docker.com/r/hashicorp/terraform/).
[^2]: see GCP [documentation](https://cloud.google.com/sdk/docs/install) or Docker [image](https://hub.docker.com/r/google/cloud-sdk/).
[^3]: see GCP [documentation](https://cloud.google.com/iam/docs/service-accounts-create).
[^4]: only required to create additional cluster firewall rules.
[^5]: only required to create service account from the module (see module [documentation](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest#configure-a-service-account)).
