# 🏗️ Terraform + VMware Infrastructure as Code

## Objective
Demonstrate repeatable VMware provisioning patterns using Terraform.

## Workflow

```bash
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
```

Inspect:

```bash
terraform state list
terraform state show <resource>
```

Destroy only lab resources:

```bash
terraform destroy
```

## Secrets

Never commit passwords or tokens.

Example:

```bash
export TF_VAR_vsphere_password='REPLACE_ME'
```

Use protected remote state, separate environments, reviewed plans, naming/tagging standards and least-privilege credentials in real deployments.

The provider in this portfolio is intentionally a skeleton; lab-specific datacenter, cluster, datastore, network and template identifiers should be supplied through variables/data sources.
