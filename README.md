# ai-devops-live

Demo repo for the AI DevOps live session. AWS region is `ap-south-1`. The app runs in the Kubernetes namespace `demo`.

Rules for every change are in [CLAUDE.md](CLAUDE.md).

## Layout

| Path | What it holds |
|------|----------------|
| `agent/` | Prompts and runbooks the agent follows |
| `app/` | Demo HTTP service and its image |
| `chaos/` | Chaos experiments, applied from Git |
| `infra/` | Terraform. Official AWS modules, pinned versions |
| `k8s/` | Manifests for the `demo` namespace |
| `.github/` | CI that checks Terraform format and validity |

## Secrets

Do not commit access keys, passwords, or `terraform.tfvars`. Copy `infra/terraform.tfvars.example` to `infra/terraform.tfvars` locally. That file is gitignored.

Cluster changes go through a commit. Do not `kubectl edit`.
