# tf-ks-sample

An IaC to bootstrap KubeSphere on GKE with Terraform.

[![Google Cloud](https://img.shields.io/badge/GCP-%234285F4.svg?style=for-the-badge&logo=google-cloud&logoColor=white)](https://cloud.google.com/docs?hl=fr)
[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://developer.hashicorp.com/terraform)
[![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/docs/home/)
[![Helm](https://img.shields.io/badge/helm-%23267a9e.svg?style=for-the-badge&logo=helm&logoColor=white)](https://helm.sh/docs/)
[![KubeSphere](https://img.shields.io/badge/kubesphere-%2351b484.svg?style=for-the-badge&logo=kubernetes&logoColor=white)](https://www.kubesphere.io/docs/v3.3/)

## Requirements

- `gcloud` cli[^1],
- `terraform` cli[^2].

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
