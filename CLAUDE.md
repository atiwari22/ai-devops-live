# ai-devops-live

Project instructions for anyone changing this repo. Follow them on every change.

## Project

- Name: `ai-devops-live`
- AWS region: `ap-south-1` only. Do not create resources in any other region.
- Kubernetes namespace for the app: `demo`

## AWS tags

Tag every AWS resource:

| Key | Value |
|-----|--------|
| Project | `ai-devops-live` |
| owner | `abhtiwar` |
| Env | `demo` |

```hcl
tags = {
  Project = "ai-devops-live"
  owner   = "abhtiwar"
  Env     = "demo"
}
```

Set the same tags as `default_tags` on the AWS provider so new resources inherit them. Still set `tags` on the module when the module does not merge provider default tags.

## Terraform

- Use the official [terraform-aws-modules](https://github.com/terraform-aws-modules) modules. Do not write raw `aws_*` resources when an official module covers the resource.
- Pin every module and provider version. No floating refs (`main`, `master`, `latest`) and no open version ranges.

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.7.3" # pin; do not use a branch or a range

  name = "ai-devops-live"
  cidr = "10.0.0.0/16"

  azs = ["ap-south-1a", "ap-south-1b"]

  tags = {
    Project = "ai-devops-live"
    owner   = "abhtiwar"
    Env     = "demo"
  }
}
```

## Secrets

Never hardcode secrets, passwords, tokens, or AWS access keys in code, Terraform, Kubernetes manifests, CI, or comments.

- Read secrets from environment variables, AWS Secrets Manager, or SSM Parameter Store.
- Commit `.tfvars.example` with placeholder names only. Keep real values out of git.
- If a secret shows up in a file, remove it and rotate it. Do not leave the old value in history comments.

## Kubernetes

- Deploy the app in the `demo` namespace.
- All fixes go through Git. Change the manifest or Helm chart, commit, and let the pipeline apply it.
- Do not run `kubectl edit`, `kubectl patch`, or any other live cluster edit. A cluster change that is not in Git will be overwritten and is not a fix.

## Code style

Keep code simple and commented. Prefer a short, obvious file over a clever abstraction. Add a comment where the next reader needs the why: region choice, module version, tag values, and any value that is not obvious from the name.
