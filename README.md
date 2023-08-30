# tf-ks-sample

An Infrastructure-as-Code to bootstrap KubeSphere on GKE with Terraform.

[![Google Cloud](https://img.shields.io/badge/GCP-%234285F4.svg?style=for-the-badge&logo=google-cloud&logoColor=white)](https://cloud.google.com/docs?hl=fr)
[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://developer.hashicorp.com/terraform)
[![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/docs/home/)
[![Helm](https://img.shields.io/badge/helm-%23267a9e.svg?style=for-the-badge&logo=helm&logoColor=white)](https://helm.sh/docs/)
[![KubeSphere](https://img.shields.io/badge/kubesphere-%2351b484.svg?style=for-the-badge&logo=kubernetes&logoColor=white)](https://www.kubesphere.io/docs/v3.3/)

## Requirements

- `gcloud`[^1] CLI,
- `terraform`[^2] CLI.

## Usage

Login to Google Cloud Platform with `gcloud` CLI:

```bash
export PROJECT_ID="MY_PROJECT"
gcloud auth login
gcloud config set project "${PROJECT_ID}"
```

---

Create a `credentials.json` key file from a GCP service account configured with necessary permissions[^3]:

```bash
export PROJECT_ID="MY_PROJECT"
export SERVICE_ACCOUNT_NAME="ts-ks-sample"
bash scripts/serviceaccount.sh "${SERVICE_ACCOUNT_NAME}" "${PROJECT_ID}"
```

This script creates a service account, binds policies to it and generates a json key file for using it. Please read `/scripts/serviceaccount.sh` and `/scripts/serviceaccounts/*.sh` to create other policy bindings or generate key for an existing service account.

---

Configure project variables directly in an interactive fashion by running Terraform CLI,
or replace values in `/provision/gcp-gke/terraform.tfvars.sample` and rename file to `terraform.tfvars`:

```bash
cd provision/gcp-gke
cp terraform.tfvars.sample terraform.tfvars # optional, replace values
terraform init
terraform plan # optional
terraform apply
terraform destroy
```

---

Change KubeSphere Helm chart values in `/provision/gcp-gke/config/ks-installer-values.yaml`,
- enable service mesh based on Istio and Envoy:
```yaml
cc:
  servicemesh:
    enable: true
```
- enable continous integration toolchain powered by Jenkins:
```yaml
cc:
  devops:
    enabled: true
```
- enable many other integrated features.

## Documentation

- Create and manage custom roles on GCP, see [documentation](https://cloud.google.com/iam/docs/creating-custom-roles).

---

- Terraform Google Cloud Plateform provider [documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs).
- Terraform Google Cloud Platform (GCP) Network module [documentation](https://registry.terraform.io/modules/terraform-google-modules/network/google/latest).
- Terraform Google Kubernetes Engine (GKE) module [documentation](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest).
- Terraform Helm provider [documentation](https://registry.terraform.io/providers/hashicorp/helm/latest/docs).
- Terraform Kubernetes provider [documentation](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs).

---

- Use Github Actions and Terraform Cloud for state handling, see Terraform [documentation](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions).
- Store Terraform state in a Google Cloud Storage (GCS) bucket, see GCP [documentation](https://cloud.google.com/docs/terraform/resource-management/store-state) and Terraform [documentation](https://developer.hashicorp.com/terraform/language/settings/backends/gcs).

## Authors

[@c3b5aw](https://github.com/c3b5aw)\
[@gmarcha](https://github.com/gmarcha)

## License

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

[^1]: see Terraform [documentation](https://developer.hashicorp.com/terraform/downloads) or Docker [image](https://hub.docker.com/r/hashicorp/terraform/).
[^2]: see GCP [documentation](https://cloud.google.com/sdk/docs/install) or Docker [image](https://hub.docker.com/r/google/cloud-sdk/).
[^3]: see GCP [documentation](https://cloud.google.com/iam/docs/service-accounts-create).
[^4]: only required to create additional cluster firewall rules.
[^5]: only required to create service account from the module (see module [documentation](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest#configure-a-service-account)).
